create or replace procedure interest
as 
    myInterest numeric;
    price numeric;
    CURSOR interestCursor is select saleprice from orders;
begin
    myinterest := 0.0;
    open interestCursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%NOTFOUND;
        if price >= 30000 then
            myInterest := myInterest + price*0.1;
        else
            myInterest := myInterest + price*0.05;
        end if;
    end loop;
    close interestCursor;
    DBMS_OUTPUT.PUT_LINE('전체 이익금액 = ' || round(myInterest,3));
end;


    
    