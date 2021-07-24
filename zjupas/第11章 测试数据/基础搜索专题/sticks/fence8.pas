{$M 10000000}
program         __Fence_Rails ;
var     board   : array[0..200000] of longint ;
        rail , sum
                : array[0..1000000] of longint ;
        n , r , ans , board_tot , tot , dfsid , us
                : longint ;

procedure       qsort (s , t : longint) ;
var     i , j , d , key : longint ;
begin
        i := s ; j := t ; key := rail[s + random (t-s+1)] ;
        repeat
         while (rail[i] < key) do inc (i) ; while (rail[j] > key) do dec (j) ;
         if (i <= j) then begin
          d := rail[i] ; rail[i] := rail[j] ; rail[j] := d ; inc (i) ; dec (j) ;
         end ;
        until (i > j) ;
        if (s < j) then qsort (s , j) ; if (i < t) then qsort (i , t) ;
end ;

procedure       otry (k , la : longint) ; 
var     i , st : longint ; // 按rail的长度从大到小进行搜索
begin
        if (k = 0) then begin
         ans := 1 ;
         exit ;
        end ;

        if (us > tot) then //如果废弃的木料长度超过限度，剪枝
         exit ;

        if (rail[k] = rail[k+1]) then
         st := la
        else
         st := 1 ; //如果两个rail一样，那么就需要假如顺序，避免重复
        for i := st to n do
         if (board[i] >= rail[k]) then begin
          dec (board[i] , rail[k]) ;
          if (board[i] < rail[1]) then //计算废弃的木料长度，rail[1]是最短的栅栏，如果它都不能满足的话...
           inc (us , board[i]) ;
          otry (k-1 , i) ;  // 我把这个写成了 otry (k-1 , la) ; 超时了几次才发现
          if (board[i] < rail[1]) then
           dec (us , board[i]) ;
          inc (board[i] , rail[k]) ;
          if (ans = 1) then
           exit ; // 我居然忘记了写这一句话，导致严重超时。
         end ;
end ;

procedure       solve ;
var     i , j , tmp , k1 , k2
                : longint ;
begin
        board_tot := 0 ;
        readln (n) ;
        for i := 1 to n do begin
         readln (board[i]) ;
         inc (board_tot , board[i]) ;
        end ;
        for i := 1 to n-1 do
         for j := i+1 to n do
          if (board[i] < board[j]) then begin
           tmp := board[i] ; board[i] := board[j] ; board[j] := tmp ;
          end ;

        readln (r) ;
        for i := 1 to r do
         readln (rail[i]) ;
        qsort (1 , r) ;
        for i := 1 to r do
         sum[i] := sum[i-1] + rail[i] ;

        while (sum[r] > board_tot) do
         dec (r) ;
        while (rail[r] > board[1]) do
         dec (r) ; // 这两个while都是可行性剪枝，缩减二分的上界

        k1 := 1 ;
        while (k1 <= r) do begin
         if (rail[k1] > board[k1]) then
          break ;
         inc (k1) ;
        end ;
        dec (k1) ; //这句话是增加二分的下界用的

        k2 := r ;
        while (k1 < k2) do begin
         dfsid := (k1 + k2 + 1) shr 1 ;
         us := 0 ;
         for i := 1 to n do
          if (board[i] < rail[1]) then
           inc (us , board[i]) ; //预处理出肯定废弃的木料的长度
         tot := board_tot - sum[dfsid] ; //废弃木料长度限制

         ans := 0 ;
         otry (dfsid , 1) ;
         if (ans = 0) then
          k2 := dfsid - 1
         else
          k1 := dfsid ;
        end ;

        writeln (k1) ;
end ;

begin
        assign (input , 'sticks29.in') ; reset (input) ;
        assign (output , 'sticks29.out') ; rewrite (output) ;

        randomize ;
        solve ;

        close (input) ; close (output) ;
end .
