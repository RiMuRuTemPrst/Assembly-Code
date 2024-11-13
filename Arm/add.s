        
// Tính tổng 10 số lưu trong mảng
        .section .data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10    // Mảng chứa 10 số nguyên

        .section .text
        .global _start

_start:
        LDR R0, =array       // Tải địa chỉ của mảng vào R0
        MOV R1, #0           // Đặt R1 = 0 (Tổng ban đầu)
        MOV R2, #10          // Đặt R2 = 10 (Số phần tử trong mảng)

loop:
        LDR R3, [R0], #4     // Tải giá trị tại địa chỉ R0 vào R3, sau đó tăng R0 lên 4 byte (Post-Indexed Addressing) 
        ADD R1, R1, R3       // Cộng giá trị của R3 vào R1 (tổng)
        SUBS R2, R2, #1      // Giảm R2 đi 1
        BNE loop             // Nếu R2 chưa bằng 0, quay lại nhãn "loop"

exit:
    B .                     // Dùng B. Đối với trình mô phỏng CPUlator

/*
Lệnh B . sẽ làm chương trình lặp lại tại nhãn exit vô thời hạn, khiến trình mô phỏng dừng như mong đợi mà không thực sự thoát ra ngoài.
-> Chỉ dùng khi làm trên trình mô phỏng trên mạng, không dùng khi chạy Arm trên thiết bị thực.
*/


