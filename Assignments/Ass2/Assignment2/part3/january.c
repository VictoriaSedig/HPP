#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct node {
   int index;
   double min;
   double max;
   struct node *next;
}node_t; 


node_t *head = NULL;
node_t *current = NULL;



void insert(node_t **head,int index, float min, float max){

if(*head == NULL){


        node_t * new_node;
        new_node = (node_t *) malloc(sizeof(node_t));
        new_node->index = index;
        new_node->min = min;
        new_node->max = max;
        new_node->next = *head;
        *head = new_node;
    }
else
    {

        node_t * current = *head;
        while (current->next->index < index && current->next != NULL) {
        current = current->next;

        }
        node_t * new_node;
        new_node = (node_t *) malloc(sizeof(node_t));
        new_node->index = index;
        new_node->min = min;
        new_node->max = max;
        new_node->next = current;
        current = new_node;
    }



}

void delete(int index){
}

void printList(node_t* head) {

    node_t* current = head;
    if (current != NULL) {
        printf("%-15s", "day");
        printf("%-15s", "min");
        printf("%-15s\n", "max");
    }
    while (current != NULL) {
        printf("%-15d", current->index);
        printf("%-15f", current->min);
        printf("%-15f\n", current->max);
        current = current->next;
    }
}


int main(){

int index;
double min;
double max;
char ch;   // The A,D or P
    while(1){
        printf("Type:\n");
        scanf(" %c %d %lf %lf", &ch, &index, &min, &max);
        //printf("%c \n", c);
         if (ch=='A'){
           // printf("Inser: \n");
            insert(&head,index, min,max);
          }
        else if(ch=='D'){
            
          delete(index);
        }
        else if(ch=='P'){
            
             printList(head);
        }
        else if(ch == 'q'){

             return 0;
         }
        }
}