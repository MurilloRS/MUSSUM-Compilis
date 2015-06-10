; ModuleID = 'main_mod'

define i16 @main() {
entry:
  call void @init()
  %0 = call i16 @analogRead(i8 0)
  %cmpi = icmp eq i16 %0, 10
  br i1 %cmpi, label %while_cond, label %if_cont

while_cond:                                       ; preds = %while_cond, %entry
  %1 = call i16 @analogRead(i8 0)
  %cmpi1 = icmp sgt i16 %1, 10
  br i1 %cmpi1, label %while_cond, label %if_cont

if_cont:                                          ; preds = %entry, %while_cond
  call void @analogWrite(i8 6, i16 255)
  ret i16 0
}

declare i16 @analogRead(i8)

declare void @analogWrite(i8, i16)

declare void @delay(i32)

declare void @init()
