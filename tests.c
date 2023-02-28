#include <criterion/criterion.h>
#include "code.h"
#include <stdio.h>

struct Student {
    char name[50];
    int age;
};

void runAddTest(int num1,int num2, int expected){
    int actual = addNums(num1, num2);
    cr_assert_str_eq(actual, expected, "addNums(\"%i\",\"%i\") should have produced \"%i\", but returned \"%i\ instead.\n",num1,num2, expected, actual);

}

Test(simpleCalc, test00) { 
    
    runAddTest(1,1,2); 

}