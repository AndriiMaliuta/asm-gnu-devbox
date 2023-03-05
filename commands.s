.data
some_var:
        .long 0x00000072
 
other_var:
        .long 0x00000001, 0x00000002, 0x00000003

.text
.globl main
main:
        movl  $0x48, %eax       /* поместить число 0x00000048 в %eax */
 
        movl  $some_var, %eax   /* поместить в %eax значение метки 
                                   some_var, то есть адрес числа в 
                                   памяти; например, у автора 
                                   содержимое %eax равно 0x08049589  */
 
        movl  some_var, %eax    /* обратиться к содержимому переменной;
                                   в %eax теперь 0x00000072          */
 
        movl  other_var + 4, %eax  /* other_var указывает на 0x00000001
                                   размер одного значения типа long — 4
                                   байта; значит, other_var + 4 
                                   указывает на 0x00000002;
                                   в %eax теперь 0x00000002          */
 
        movl  $1, %ecx          /* поместить число 1 в %ecx          */

        movl  other_var(,%ecx,4), %eax  /* поместить в %eax первый 
                                   (нумерация с нуля) элемент массива 
                                   other_var, пользуясь %ecx как 
                                   индексным регистром               */
 
        movl  $other_var, %ebx  /* поместить в %ebx адрес массива 
                                   other_var                         */

        movl  4(%ebx), %eax     /* обратиться по адресу %ebx + 4;
                                   в %eax снова 0x00000002           */
 
        movl  $other_var + 4, %eax  /* поместить в %eax адрес, по 
                                   которому расположен 0x00000002
                                   (адрес массива плюс 4 байта -- 
                                   пропустить нулевой элемент)       */

        movl  $0x15, (%eax)     /* записать по адресу "то, что записано