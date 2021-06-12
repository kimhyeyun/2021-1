#include <iostream>
using namespace std;

struct Node
{
public:
    int key;
    Node *left;
    Node *right;
    Node *parent;
    int color;
};

class RBTree
{
public:
    Node *root;
    Node *leafNode = NULL;

    bool isFind(int item)
    {
        Node *t = root;
        Node *p = NULL;
        int d = 0;

        while (t != NULL)
        {
            if (t->key == item)
            {
                return true;
            }
            
            p = t;

            if (p->key > item)
            {
                t = p->left;
            }
            else
            {
                t = p->right;
            }
            d++;
        }
        return false;
    }

    void Insert(int item){
        Node *p, *q;
        Node *n = new Node();
        n ->key= item;
        n->color = 1;
        n->left = NULL;
        n->right = NULL;

        p = root;
        q = NULL;

        if(root == NULL){
            root = n;
            n->parent = NULL;
            n->color = 0;
        }
        else{
            while(p != NULL){
                q = p;
                if(p->key < n->key)
                    p = p->right;
                else
                    p = p->left;
            }

            n->parent = q;
            if(q->key < n->key)
                q->right = n;
            else
                q->left = n;
        }

        insertFix(n);
    }

    void insertFix(Node *t){
        Node *u;
        if(root == t){
            t->color = 0;
            t->parent = NULL;
            return;
        }

        while(t->parent != NULL && t->parent->color == 1){
            Node *g = t->parent->parent;

            //부모가 왼쪽자식 g > p
            if(g->left == t->parent){
                //recoloring
                u = g->right;
                if(g->right != NULL && u->color == 1){
                    t->parent->color = 0;
                    u->color = 0;
                    g->color = 1;
                    t = g;
                }
                //restructing
                else{
                    //t가 부모의 오른쪽자식
                    if(t->parent->right == t){
                        t = t->parent;
                        leftrotate(t);
                    }
                    //t가 부모의 왼쪽자식
                    t->parent->color = 0;
                    g->color = 1;
                    rightrotate(g);
                }
            }
            //부모가 조부모의 오른쪽 자식
            else{
                u=g->left;
                if(g->left!=NULL && u->color == 1){
                    t->parent->color=0;
                    u->color=0;
                    g->color=1;
                    t = g;
                }
                else{
                    if(t->parent->left == t){
                        t=t->parent;
                        rightrotate(t);
                    }
                    t->parent->color = 0;
                    g->color = 1;
                    leftrotate(g);
                }
            }
            root->color = 0;
            root->parent = NULL;
        }
    }

    void leftrotate(Node *n){
        if(n->right == NULL)
            return;
        else{
            Node *y = n->right;
            if(y->left != NULL){
                n->right = y->left;
                y->left->parent = n;
            }

            else
                n->right = NULL;

            if(n->parent!=NULL)
                y->parent = n->parent;
            if(n->parent == NULL)
                root = y;

            else{
                if(n == n->parent->left)
                    n->parent->left = y;
                else
                    n->parent->right = y;
            }
            y->left = n;
            n->parent = y;
        }
    }

    void rightrotate(Node *n){
        if(n->left == NULL) 
            return;

        else{
            Node *y = n->left;
            if(y->right != NULL){
                n->left = y->right;
                y->right->parent = n;
            }
            else
                n->left = NULL;
            if(n->parent != NULL)
                y->parent = n->parent;
            if(n->parent ==NULL)
                root = y;
            
            else{
                if(n == n->parent->left)
                    n->parent->left = y;
                else    
                    n->parent->right = y;
            }

            y->right = n;
            n->parent = y;
        }
    }


    // void Insert(int item)
    // {
    //     if(!isFind(item)){
    //     Node *x = this->root;
    //     Node *y = NULL;
    //     Node *newN = new Node();
    //     newN->key = item;
    //     newN->color = 1;
    //     newN->left = NULL;
    //     newN->right = NULL;
    //     newN->parent = NULL;

    //     while (x != leafNode)
    //     {
    //         y = x;
    //         if (x->key < item)
    //             x = x->right;
    //         else
    //             x = x->left;
    //     }

    //     newN->parent = y;

    //     if (y == NULL)
    //         root = newN;
    //     else if (newN->key > y->key)
    //     {
    //         y->right = newN;
    //     }
    //     else
    //     {
    //         y->left = newN;
    //     }

    //     if (newN->parent == NULL)
    //     {
    //         newN->color = 1;
    //         return;
    //     }

    //     if (newN->parent->parent == NULL)
    //     {
    //         return;
    //     }

    //     InsertFixUp(newN);

    //     cout << "y";
    //     return;
    //     }
    //     else
    //         cout<<"n";
    // }

    // void InsertFixUp(Node *n)
    // {
    //     while (n != root && n->parent->color == 1)
    //     {
    //         Node *grand = n->parent->parent;
    //         Node *uncle = (n->parent == grand->left) ? grand->right : grand->left;

    //     //     bool side = (n->parent == grand->left) ? true : false;

    //     //     if (uncle && uncle->color == 1)
    //     //     {
    //     //         n->parent->color = 0;
    //     //         uncle->color = 0;
    //     //         grand->color = 1;
    //     //         n = grand;
    //     //     }
    //     //     else
    //     //     {
    //     //         if (n == (side ? n->parent->right : n->parent->left))
    //     //         {
    //     //             n = n->parent;
    //     //             side ? RotateLeft(n) : RotateRight(n);
    //     //         }

    //     //         n->parent->color = 0;
    //     //         grand->color = 1;
    //     //         side ? RotateRight(grand) : RotateLeft(grand);
    //     //     }
    //     // }
    //     // root->color = 0;


    // }

    void RotateLeft(Node *x)
    {
        Node *y;

        y = x->right;
        x->right = y->left;
        if (y->left != leafNode)
        {
            y->left->parent = x;
        }
        y->parent = x->parent;

        if (!x->parent)
        {
            root = y;
        }
        else if (x == x->parent->left)
        {
            x->parent->left = y;
        }
        else
        {
            x->parent->right = y;
        }
        x->parent = y;
        y->left = x;
    }

    void RotateRight(Node *y)
    {
        Node *x;

        x = y->left;
        y->left = x->right;
        if (x->right != leafNode)
        {
            x->right->parent = y;
        }
        x->parent = y->parent;

        if (!y->parent)
        {
            root = x;
        }
        else if (y == y->parent->left)
        {
            y->parent->left = x;
        }
        else
        {
            y->parent->right = x;
        }
        y->parent = x;
        x->right = y;
    }

    void Inorder(Node *target)
    {
        if (target == leafNode)
            return;
        Inorder(target->left);
        cout << target->key << " ";
        Inorder(target->right);
    }
};

int main()
{
    RBTree rb;
    int a;
    cin >> a;
    for(int i=0;i<a;i++)
    {
        int x;
        cin >> x;
        rb.Insert(x);
    }

    rb.Inorder(rb.root);
}