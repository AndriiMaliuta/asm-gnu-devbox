.data
printf_format:
        .string "%d\n"
 
array:
        .long -10, -15, -148, 12, -151, -3, -72
array_end:
 
.text
.globl main
main:
        movl  array, %eax         /* в %eax будет храниться результат;
                                   в начале наибольшее значение — array[0]*/
        movl  $array+4, %ebx      /* в %ebx находится адрес текущего 
                                   элемента массива                  */
        jmp   ch_bound          /* проверить границы массива */
loop_start:                     /* начало цикла                      */
        cmpl  %eax, (%ebx)      /* сравнить текущий элемент массива с 
                                   текущим наибольшим значением из %eax
                                                                     */
        jle   less              /* если текущий элемент массива меньше 
                                   или равен наибольшему, пропустить 
                                   следующий код                     */
        movl  (%ebx), %eax      /* а вот если элемент массива 
                                   превосходит наибольший, значит, его 
                                   значение и есть новый максимум    */
less:
        addl  $4, %ebx          /* увеличить %ebx на размер одного 
                                   элемента массива, 4 байта         */
ch_bound:
        cmpl  $array_end, %ebx  /* сравнить адрес текущего элемента и 
                                   адрес конца массива               */
        jne    loop_start        /* если они не равны, повторить цикл снова* 
/*
 * следующий код выводит число из %eax на экран и завершает программу
 */
        pushl %eax
        pushl $printf_format
        call  printf
        addl  $8, %esp
 
        movl  $0, %eax
        ret