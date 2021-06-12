#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>
#include <stack>
#include <string.h>

using namespace std;

//지역 정보 구조체
struct location
{
    int number;  //지역 번호 (100,000 ~ 999,999 사이의 정수)
    string name; //지역 이름(공백 없는 20byte 이내의  문자열)
    int flood;   //침수 여부 (1: 침수 , 0: 침수되지 않음)
};

//도로 정보 구조체
struct road
{
    int from;     //출발지 지역 번호
    int to;       //도착지 자역 번호
    int distance; //도로의 거리 (1~5,000 사이의 정수)
};

//지역 정보 구조체를 지역 번호 순으로 정렬하기 위한
bool cmp(location l1, location l2)
{
    return l1.number < l2.number;
}

class Navigation
{
public:
    vector<location> loc;                           //지역저장
    vector<road> tree;                              //tree vertex set, 지나가는 경로들 저장
    vector<vector<pair<int, int> > > adj;           //인접 리스트 기반 그래프 [start] = {도착지, 거리}
    priority_queue<pair<int, pair<int, int> > > pq; //우선순위 큐 {거리, 도착지, 출발지} 거리가 짧은 순, 같다면 도착지의 지역번호가 작은순
    int Idx[1000001];                               //지역 구조체와 연결하기위한 배열
    int dist[1000001];                              //최단 거리 저장
    bool visited[1000001];                          //방문 여부

    Navigation()
    {
        this->adj.resize(1000001);
    }

    //지역 구조체 저장
    void addLocation(int num, string name, int flood)
    {
        location l = {num, name, flood};
        this->loc.push_back(l);
    }

    //도로 구조체 저장
    void addRoad(int start, int destination, int distance)
    {
        this->adj[start].push_back(make_pair(destination, distance));
        this->adj[destination].push_back(make_pair(start, distance));
    }

    //지역 구조체와 지역번호를 매칭하기 위해서 지역 구조체 배열을 오름차순으로 정렬하고 index 저장
    void Match()
    {
        sort(this->loc.begin(), this->loc.end(), cmp);

        for (unsigned int i = 0; i < this->loc.size(); i++)
        {
            Idx[loc[i].number] = i;
        }
    }

    //다익스트라 알고리즘으로 최단 경로 찾기
    void dijkstra(int start, int destination)
    {
        //초기화
        tree.clear();
        while (!pq.empty())
            pq.pop();

        memset(dist, 0, sizeof(dist));
        memset(visited, false, sizeof(visited));

        //To = -1 처음 경로 추가
        road r = {-1, start, 0};
        tree.push_back(r);
        visited[start] = true;

        //start와 연결된 도로들 탐색
        for (unsigned int i = 0; i < adj[start].size(); i++)
        {
            //도착지가 침수 되지 않았다면
            if (loc[Idx[adj[start][i].first]].flood == 0)
            {
                //priority_queue에 추가
                //priority_queue는 큰 순으로 내림차순으로 우선순위를 두기 때문에 거리와 도착지 지역번호에 음수 부호 장착
                pq.push(make_pair(-adj[start][i].second, make_pair(-adj[start][i].first, start)));
            }
        }

        while (!pq.empty())
        {
            //거리가 제일 짧거나, 같다면 도착지의 지역넘버가 가장 작은 지역 선택
            //음수로 저장을 했기때문
            int minD = -(pq.top().first);
            int minTo = -(pq.top().second.first);
            int minFrom = pq.top().second.second;

            //안간곳이라면 추가!
            if (!visited[minTo])
            {
                road r = {minFrom, minTo, minD};
                tree.push_back(r);
                dist[minTo] = minD;
                visited[minTo] = true;
            }

            //이미 방문했다면 pop
            else
            {
                pq.pop();
                continue;
            }

            //도착지에 도착했다면 종료
            if (minTo == destination)
                break;

            //이어진 도로 탐색
            for (unsigned int i = 0; i < adj[minTo].size(); i++)
            {
                if (loc[Idx[minTo]].flood == 0 && loc[Idx[adj[minTo][i].first]].flood == 0)
                {
                    if (!visited[adj[minTo][i].first])
                        pq.push(make_pair(-(adj[minTo][i].second + dist[minTo]), make_pair(-adj[minTo][i].first, minTo)));
                }
            }
            pq.pop();
        }
    }

    //최단 거리 출력
    void SearchShortestLength(int start, int destination)
    {
        //출발지와 도착지가 침수 되었다면 none 출력하고 종료
        if (loc[Idx[start]].flood == 1 || loc[Idx[destination]].flood == 1)
        {
            cout << "None"
                 << "\n";
            return;
        }
        else
        {
            this->dijkstra(start, destination);

            //최단 거리가 1,000,000을 넘는다면 none 출력
            if (dist[destination] == 0 || dist[destination] > 1000000)
                cout << "None"
                     << "\n";
            else
                // tree vertex set 크기, 최단 거리, 출발 지역 이름, 도착 지역 이름
                cout << tree.size() << " " << dist[destination] << " " << loc[Idx[start]].name << " " << loc[Idx[destination]].name << "\n";
        }
    }

    //최단 경로 출력
    void SearchShortestPath(int start, int destination)
    {
        //출발지와 도착지가 침수되었다면 none 출력 후 종료
        if (loc[Idx[start]].flood == 1 || loc[Idx[destination]].flood == 1)
        {
            cout << "None"
                 << "\n";
            return;
        }
        else
        {
            this->dijkstra(start, destination);

            if (dist[destination] == 0 || dist[destination] > 1000000)
                cout << "None"
                     << "\n";
            else
            {
                //도착지 부터 시작해서 tree vertex set에 저장된 경로들을 역순으로 찾아 올라가기 때문에 stack 사용
                stack<int> stk;
                int prev = destination;

                // -1 이면 출발 지역 이전이라 종료
                while (prev != -1)
                {
                    stk.push(loc[Idx[prev]].number);

                    for (unsigned int i = 0; i < tree.size(); i++)
                    {
                        if (tree[i].to == prev)
                        {
                            prev = tree[i].from;
                            break;
                        }
                    }
                }

                cout << tree.size() << " ";

                while (!stk.empty())
                {
                    cout << stk.top() << " ";
                    stk.pop();
                }
                cout << "\n";
            }
        }
    }
};

int main()
{
    int n, m, q;
    cin >> n >> m >> q;

    Navigation *navi = new Navigation();

    for (int i = 0; i < n; i++)
    {
        int num, flood;
        string name;
        cin >> num >> name >> flood;

        navi->addLocation(num, name, flood);
    }

    navi->Match();

    for (int i = 0; i < m; i++)
    {
        int start, destination, distance;
        cin >> start >> destination >> distance;

        navi->addRoad(start, destination, distance);
    }

    while (q--)
    {
        string str;
        int start, destination;

        cin >> str >> start >> destination;

        if (str == "A")
        {
            navi->SearchShortestLength(start, destination);
        }
        else if (str == "B")
        {
            navi->SearchShortestPath(start, destination);
        }
    }
}