#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct node {
    int index;
    double min;
    double max;
    struct node* next;
}node_t;


node_t* head = NULL;
node_t* current = NULL;



void insert(node_t** head, int index, float min, float max) {

    //Node placed in first position
    if (*head == NULL || (*head)->index >= index) {


        node_t* new_node;
        new_node = (node_t*)malloc(sizeof(node_t));
        new_node->index = index;
        new_node->min = min;
        new_node->max = max;
        new_node->next = *head;
        *head = new_node;
    }
    else
    {
        //Find place to put new node
        node_t* current = *head;
        while (current->next != NULL && current->next->index < index) {
            current = current->next;

        }
        node_t* new_node;
        new_node = (node_t*)malloc(sizeof(node_t));
        new_node->index = index;
        new_node->min = min;
        new_node->max = max;
        new_node->next = current->next;
        current->next = new_node;
    }



}

void delete(node_t** head, int index) {

    node_t* temp_node;
    if (*head != NULL){
        node_t* current = *head;

        //Find node to be deleted

        while (current->index != index && current->next != NULL) {
            temp_node = current;
            current = current->next;

        }
        if (current->index == index) {
            
            //remove node and free memory

            if (current == *head) {
                *head = (*head)->next;
                free(current);
            }
            else {
                temp_node->next = current->next;
                free(current);
            }

        }
        

        
    }


}

//Function for printing the full list

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


    while(1){
    int index;
    double min;
    double max;
    char ch;   // The A,D or P
        
        //Find what function should be used first, then inputs for the function
        scanf("%c", &ch);
        
        if (ch=='A'){
            scanf(" %d %lf %lf",&index, &min, &max);

            insert(&head,index, min,max);
            }
        else if(ch=='D'){
            scanf(" %d ",&index);

            delete(&head,index);
        }
        else if(ch=='P'){
          
            printList(head);
        }
        else if(ch == 'q'){

            return 0;
         }
        }
}