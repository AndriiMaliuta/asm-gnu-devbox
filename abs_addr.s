.data
num:
        .long    0x12345678

.text
main:
        movl    (num), %eax   /* Записать в регистр %eax операнд, 
                                 который содержится в оперативной 
                                 памяти по адресу метки num          */
        
        addl    (num), %eax   /* Сложить с регистром %eax операнд, 
                                 который содержится в оперативной 
                                 памяти по адресу метки num и записать 
                                 результат в регистр %eax            */
        
        ret