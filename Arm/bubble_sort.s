    .data
array:  .word 5, 3, 1, 4, 2          @ Mảng 5 phần tử cần sắp xếp

    .text
    .global _start

_start:
    LDR R1, =array             @ Load địa chỉ của mảng vào R1
    MOV R9, #5                 @ Số lượng phần tử trong mảng

bubble_sort:
    SUB R2, R9, #1             @ R2 = số lần lặp của vòng lặp ngoài (n - 1)
    
outer_loop:
    MOV R3, #0                 @ Khởi tạo chỉ số bên trong (j = 0)
    MOV R10, #0                @ Đặt cờ hoán đổi (swap flag) = 0

inner_loop:
    LSL R4, R3, #2             @ Tính offset của array[j] bằng j * 4
    LDR R5, [R1, R4]           @ Load array[j] vào R5

    ADD R6, R4, #4             @ Tính offset của array[j+1]
    LDR R7, [R1, R6]           @ Load array[j+1] vào R7

    CMP R5, R7                 @ So sánh array[j] với array[j+1]
    BLE no_swap                @ Nếu array[j] <= array[j+1], bỏ qua đổi chỗ

    @ Đổi chỗ array[j] và array[j+1] sử dụng thanh ghi tạm R8
    MOV R8, R5                 @ R8 = array[j]
    STR R7, [R1, R4]           @ array[j] = array[j+1]
    STR R8, [R1, R6]           @ array[j+1] = R8
    MOV R10, #1                @ Đặt cờ hoán đổi = 1

no_swap:
    ADD R3, R3, #1             @ j++

    CMP R3, R2                 @ Kiểm tra j với số lần lặp bên trong
    BLT inner_loop             @ Nếu j < R2, tiếp tục vòng lặp bên trong

    CMP R10, #0                @ Kiểm tra cờ hoán đổi
    BEQ sorted                 @ Nếu không có hoán đổi, mảng đã sắp xếp xong

    SUB R2, R2, #1             @ Giảm vòng lặp ngoài (i--)
    CMP R2, #0                 @ Kiểm tra vòng lặp ngoài
    BGT outer_loop             @ Nếu i > 0, tiếp tục vòng lặp ngoài

sorted:
    @ Lấy các giá trị đã sắp xếp vào các thanh ghi R3 đến R7
    LDR R3, [R1]               @ array[0]
    LDR R4, [R1, #4]           @ array[1]
    LDR R5, [R1, #8]           @ array[2]
    LDR R6, [R1, #12]          @ array[3]
    LDR R7, [R1, #16]          @ array[4]

exit:
    B .                        @ Kết thúc chương trình
