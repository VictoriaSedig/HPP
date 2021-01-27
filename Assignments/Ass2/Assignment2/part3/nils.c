void insert(node_t ** head, int index,float min,float max) {
    if (*head == NULL) {
        
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

        node_t * current = head;
        while (current->next->index < index && current->next->index != NULL) {
        current = current->next;

        }
        node_t * new_node;
        new_node = (node_t *) malloc(sizeof(node_t));
        new_node->index = index;
        new_node->min = min;
        new_node->max = max;
        new_node->next = current;
        current = new_node
    }


    int binom(int n,int k){
if (n==0) return 1;
if (n==k) return 1;
if (k==0) return 1;

return binom(n-1,k-1) + binom(n-1, k);
}