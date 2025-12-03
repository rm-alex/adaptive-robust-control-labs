Q=eye(2);
Am=[0 1;
    -2 -4];

cvx_begin sdp
variable P(2,2)
Am'*P+P*Am == -Q;
cvx_end

P