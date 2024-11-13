//Hoán đổi vị trí 2 số trong mảng
        .section .data
array:  .word 5, 10, 15, 20, 25   // Mảng chứa 5 số nguyên

        .section .text
        .global _start

_start:
        LDR R0, =array            // Tải địa chỉ của mảng vào R0
        LDR R1, [R0]              // Tải phần tử đầu tiên của mảng vào R1
        LDR R2, [R0, #4]          // Tải phần tử thứ hai của mảng vào R2

        // Hoán đổi giá trị giữa R1 và R2 bằng cách sử dụng thanh ghi tạm R3
        MOV R3, R1                // Lưu giá trị của R1 vào R3
        MOV R1, R2                // Gán giá trị của R2 cho R1
        MOV R2, R3                // Gán giá trị của R3 (giá trị ban đầu của R1) cho R2

        // Lưu các giá trị đã hoán đổi vào mảng
        STR R1, [R0]              // Lưu giá trị của R1 (giá trị ban đầu của phần tử thứ hai) vào vị trí đầu tiên
        STR R2, [R0, #4]          // Lưu giá trị của R2 (giá trị ban đầu của phần tử đầu tiên) vào vị trí thứ hai

        // In lại toàn bộ mảng bằng cách tải từng phần tử vào các thanh ghi
        LDR R4, [R0]              // Tải phần tử đầu tiên vào R4
        LDR R5, [R0, #4]          // Tải phần tử thứ hai vào R5
        LDR R6, [R0, #8]          // Tải phần tử thứ ba vào R6
        LDR R7, [R0, #12]         // Tải phần tử thứ tư vào R7
        LDR R8, [R0, #16]         // Tải phần tử thứ năm vào R8

exit:
        B .                        // Tạo vòng lặp vô hạn để dừng chương trình
