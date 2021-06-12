#include <iostream>
using namespace std;

//유행병 카운트를 위한 전역 변수
int dcnt = 0;

//환자의 주소 좌표 저장 구조체
struct addr
{
    int x;
    int y;
};

//환자의 진료기록 저장 구조체
struct history
{
    string dName;
    int price;
};

//환자 정보 저장
class Patient
{
public:
    int Pnum;
    string name;
    string phoneNum;
    addr Pad;
    history Phis;

    Patient(int Pnum, string name, string phoneNum, addr Pad, history Phis)
    {
        this->Pnum = Pnum;
        this->name = name;
        this->phoneNum = phoneNum;
        this->Pad = Pad;
        this->Phis = Phis;
    }
};

//환자 정보를 가진 node 
class Node
{
public:
    Patient *p;
    Node *left;
    Node *right;
    Node *parent;
    //각 노드의 색상표시를 위해서 (0: Black, 1:Red)
    int color;

    Node(Patient *p)
    {
        this->p = p;
        this->left = NULL;
        this->right = NULL;
        this->parent = NULL;
        this->color = 1;
        //처음 node가 추가되면 빨간색으로 초기화
    }
};

class RedBlackTree
{
public:
    Node *root;     //루트 노드
    Node *leafNode; //단말 노드

    RedBlackTree()
    {
        root = NULL;
        leafNode = NULL;
    }

    //노드가 존재하는가? 있다면 true, 없다면 false
    bool isFind(Node *n)
    {
        Node *s = root;
        Node *par = NULL;
        int pnum = n->p->Pnum;

        while (s != NULL)
        {
            //일치하는것을 찾았다면
            if (s->p->Pnum == pnum)
            {
                return true;
            }

            par = s;
            if (pnum < par->p->Pnum)
                s = par->left;
            else
                s = par->right;
        }
        return false;
    }

    //depth 찾기
    int Depth(int pn)
    {
        Node *tmp = root;
        int d = 0;
        while (tmp != NULL)
        {
            int t = tmp->p->Pnum;
            if (t == pn)
            {
                break;
            }

            if (t < pn)
            {
                tmp = tmp->right;
            }
            else
            {
                tmp = tmp->left;
            }

            d++;
        }
        return d;
    }

    //환자 추가
    void insertPatient(Patient *newP)
    {
        Node *n = new Node(newP);
        //빈 트리
        if (root == NULL)
        {
            root = n;
            root->color = 0;
            root->parent = NULL;
            cout << 0 << " " << 1 << "\n";
            return;
        }
        else
        {
            //이미 같은 번호의 환자 존재
            if (isFind(n))
            {
                cout << Depth(newP->Pnum) << " " << 0 << "\n";
                return;
            }
            //존재 않함 -> 추가를 위해 위치 찾기
            else
            {
                Node *tmp = root;
                Node *par = NULL;

                while (tmp != NULL)
                {
                    par = tmp;
                    if (tmp->p->Pnum < n->p->Pnum)
                    {
                        tmp = tmp->right;
                    }
                    else
                    {
                        tmp = tmp->left;
                    }
                }
                n->parent = par;
                if (par->p->Pnum < n->p->Pnum)
                {
                    par->right = n;
                }
                else
                {
                    par->left = n;
                }

                FixUp(n);

                cout << Depth(n->p->Pnum) << " " << 1 << "\n";
                return;
            }
        }
    }

    void FixUp(Node *n)
    {
        if (n == root)
        {
            n->color = 0;
            return;
        }

        while (n->parent != NULL && n->parent->color == 1)
        {
            Node *grand = n->parent->parent;
            Node *uncle;

            //case 1.부모노드가 조부모노드의 왼쪽 자식일때 (grand > parent)
            if (grand->left == n->parent)
            {
                uncle = grand->right;
                //case 1-1.삼촌 노드가 존재하고 빨간색일때 -> recoloring
                if (grand->right != NULL && uncle->color == 1)
                {
                    n->parent->color = 0;
                    uncle->color = 0;
                    grand->color = 1;
                    n = grand;
                }

                //case 1-2.삼촌노드가 존재안하거나 검은색일때-> restructing
                else
                {
                    //case 1-2-1.현재 노드가 부모노드보다 클 때
                    // parent < me < grand
                    // me 가 가운데 노드가 되어야함
                    if (n->parent->right == n)
                    {
                        n = n->parent;
                        LeftRotate(n);
                    }

                    //case 1-2-2. 현재노드가 부모노드보다 작을 때
                    // me < parent < grand
                    n->parent->color = 0;
                    grand->color = 1;
                    RightRotate(grand);
                }
            }

            //case 2.부모노드가 조부모 노드의 오른쪽 자식일때 (grand < parent)
            else
            {
                uncle = grand->left;
                //case 2-1.삼촌 노드가 존재하고 빨강색일때 -> recoloring
                if (grand->left != NULL && uncle->color == 1)
                {
                    n->parent->color = 0;
                    uncle->color = 0;
                    grand->color = 1;
                    n = grand;
                }

                //case 2-2. 삼촌 노드가 존재하지 않을 때 -> restructing
                else
                {
                    //case 2-2-1. 현재 노드가 부모노드보다 작을 때
                    // grand < me < parent
                    if (n->parent->left == n)
                    {
                        n = n->parent;
                        RightRotate(n);
                    }

                    //case 2-2-2. 현재노드가 부모노드보다 클 때
                    //조부모, 부모, 현재 노드가 오른쪽 한 방향으로 존재
                    //조부모 < 부모 < 현재 노드, 부모가 가운데로 와야함
                    n->parent->color = 0;
                    grand->color = 1;
                    LeftRotate(grand);
                }
            }
            root->color = 0;
            root->parent = NULL;
        }
    }

    //node n을 왼쪽으로 회전 시키기
    void LeftRotate(Node *n)
    {
        if (n->right == NULL)
        {
            return;
        }
        else
        {
            Node *tmp = n->right;

            if (tmp->left != NULL)
            {
                n->right = tmp->left;
                tmp->left->parent = n;
            }
            else
            {
                n->right = NULL;
            }

            if (n->parent != NULL)
            {
                tmp->parent = n->parent;
            }

            if (n->parent == NULL)
            {
                root = tmp;
            }
            else
            {
                if (n == n->parent->left)
                {
                    n->parent->left = tmp;
                }
                else
                {
                    n->parent->right = tmp;
                }
            }
            tmp->left = n;
            n->parent = tmp;
        }
    }

    //Node n을 오른쪽으로 회전시키기
    void RightRotate(Node *n)
    {
        if (n->left == NULL)
            return;

        else
        {
            Node *tmp = n->left;

            if (tmp->right != NULL)
            {
                n->left = tmp->right;
                tmp->right->parent = n;
            }
            else
            {
                n->left = NULL;
            }

            if (n->parent != NULL)
            {
                tmp->parent = n->parent;
            }

            if (n->parent == NULL)
            {
                root = tmp;
            }
            else
            {
                if (n == n->parent->left)
                {
                    n->parent->left = tmp;
                }
                else
                {
                    n->parent->right = tmp;
                }
            }
            tmp->right = n;
            n->parent = tmp;
        }
    }

    //환자 검색
    //입력받은 환자번호와 일치하는 환자 탐색하고 있다면 깊이 출력, 없다면 not found 출력
    void SearchPatient(int num)
    {
        Node *tmp = root;
        int depth = 0;

        while (tmp != NULL)
        {
            int pn = tmp->p->Pnum;
            if (pn == num)
            {
                cout << depth << " " << tmp->p->name << " " << tmp->p->phoneNum << " " << tmp->p->Pad.x << " " << tmp->p->Pad.y << "\n";
                return;
            }
            if (pn < num)
            {
                tmp = tmp->right;
            }
            if (pn > num)
            {
                tmp = tmp->left;
            }
            depth++;
        }
        cout << "Not found"<< "\n";
        return;
    }

    //추가 진료
    //입력받은 환자 번호를 찾아 존재하면 새로운 병명과 진료비를 추가하고 노드의 깊이 출력, 없다면 not found 출력
    void AdditionalCare(int num, string dname, int price)
    {
        Node *tmp = root;
        //깊이
        int depth = 0;

        //단말 노드에 도달하면 존재하지 않음
        while (tmp != leafNode)
        {
            int pn = tmp->p->Pnum;
            //입력과 같은 환자번호를 가진 환자를 찾으면
            if (pn == num)
            {
                tmp->p->Phis.dName = dname;
                tmp->p->Phis.price = price;
                cout << depth << "\n";
                return;
            }
            if (pn < num)
            {
                tmp = tmp->right;
                depth++;
            }
            if (pn > num)
            {
                tmp = tmp->left;
                depth++;
            }
        }
        cout << "Not found"<< "\n";
        return;
    }

    //유행병 조사
    //마지막 진단받은 병명과 입력으로 주어진 병명이 동일한 수 출력
    void CntEpidemic(Node *tmp, string dname)
    {   
        //단말노드에 도착하면 종료
        if (tmp == leafNode)
            return;
        //일치하면 개수 증가
        if (tmp->p->Phis.dName == dname)
            dcnt++;
        //왼쪽 서브 트리 검사
        CntEpidemic(tmp->left, dname);
        //오른쪽 서브 트리 검사
        CntEpidemic(tmp->right, dname);
    }
};

int main()
{
    RedBlackTree *rbt = new RedBlackTree();

    int test_case;
    cin >> test_case;

    while (test_case--)
    {
        string str;
        cin >> str;

        if (str == "I")
        {
            int num, xaddr, yaddr, price;
            string name, phone, disease;

            cin >> num >> name >> phone >> xaddr >> yaddr >> disease >> price;
            addr a;
            a.x = xaddr;
            a.y = yaddr;

            history h;
            h.dName = disease;
            h.price = price;

            Patient *p = new Patient(num, name, phone, a, h);

            rbt->insertPatient(p);
        }

        else if (str == "F")
        {
            int num;
            cin >> num;

            rbt->SearchPatient(num);
        }

        else if (str == "A")
        {
            int num, price;
            string dname;

            cin >> num >> dname >> price;

            rbt->AdditionalCare(num, dname, price);
        }

        else if (str == "E")
        {
            string dname;
            cin >> dname;

            dcnt = 0;
            rbt->CntEpidemic(rbt->root, dname);
            cout << dcnt << "\n";
        }
    }
}



