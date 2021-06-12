#include<stdio.h>
#include<math.h>

int main(){
    long long addr;
    int binary[64] = {0,};

    scanf("%lld",&addr);

    int cnt = 63;
    while(addr != 0){
        binary[cnt] = addr%2;
        addr = addr/2;
        cnt = cnt-1;
    }

    int addressfield[4]={0,};
    int fieldindex = 0;
    int powindex = 15;


    for(int i=0;i<64;i++){
        if(binary[i] == 1){
            addressfield[fieldindex] =  addressfield[fieldindex] + pow(2,powindex);
        }

        powindex = powindex-1;

        if(powindex == -1){
            powindex = 15;
            fieldindex = fieldindex + 1;

        }
    }

    printf("Address field: %lld\n",addr);
    printf("Destination PAN ID: %d, %x\n",addressfield[0],addressfield[0]);
    printf("Destination Address: %d, %x\n",addressfield[1],addressfield[1]);
    printf("Source PAN ID : %d, %x\n",addressfield[2],addressfield[2]);
    printf("Source Address: %d, %x\n",addressfield[3],addressfield[3]);

}
