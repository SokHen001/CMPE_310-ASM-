#include <stdio.h>

extern int sumOfData(int numbers[], long numOfNumbers);

int main(int numOfArgs, char *args[]){
    FILE *file;
    long numOfNumbers;
    int total;

    if (numOfArgs < 2){
        printf("Need a file name\n");
        return 1;
    }

    file = fopen(args[1], "r");

    if (file == NULL){
        printf("File did not open\n");
        return 1;
    }

    fscanf(file, "%ld", &numOfNumbers);

    int numbers[numOfNumbers];

    long i = 0;
    while (i < numOfNumbers){
        fscanf(file, "%d", &numbers[i]);
        
        i++;
    }

    fclose(file);

    total = sumOfData(numbers, numOfNumbers);
    
    printf("The sum is: %d\n", total);

    return 0;

}
