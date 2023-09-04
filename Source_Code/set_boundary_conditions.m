function [u_gh_we, v_gh_sn, p_gh_we, p_gh_sn] = set_boundary_conditions(nx,ny,u,v,p,T,Utop,Tbot)

  u_gh_we = zeros(2,ny);
 % v_gh_we = zeros(2,ny+1);
  p_gh_we = zeros(2,ny);
 % T_gh_we = zeros(2,ny);

 % u_gh_sn = zeros(nx+1,2);
  v_gh_sn = zeros(nx,2);
  p_gh_sn = zeros(nx,2);
%  T_gh_sn = zeros(nx,2);

  % set the bc values
  u_bc_w = 0; u_bc_e = 0; u_bc_s = 0; u_bc_n = Utop; T_bc_n = 0;
  v_bc_w = 0; v_bc_e = 0; v_bc_s = 0; v_bc_n = 0; T_bc_s = Tbot;

   

  % west: rigid wall
  u_gh_we(1,:) = 2*u_bc_w - u(2,:);
  v(1,:) = v_bc_w;

  p_gh_we(1,:) =  p(2,:);
  %T_gh_we(1,:) =  T(2,:);
  T(1,:)=T(2,:);
  


  % east: rigid wall
  u_gh_we(2,:) = 2*u_bc_e - u(nx,:);
  v(nx,:) = v_bc_e;
  p_gh_we(2,:) =  p(nx-1,:);
  %T_gh_we(2,:) =  T(nx-1,:);
  T(nx,:)=T(nx-1,:);

  % south: rigid wall
  u(:,1) = u_bc_s;
  v_gh_sn(:,1) = 2*v_bc_s-v(:,2);
  p_gh_sn(:,1) =  p(:,2);
  T(:,1)=T_bc_s;
  %T_gh_sn(:,1) = 2*T_bc_s-T(:,2);

  % north: rigid wall
  u(:,ny) = u_bc_n;
  v_gh_sn(:,2) = 2*v_bc_n-v(:,ny);
  p_gh_sn(:,2) =  p(:,ny-1);
  T(:,ny)=T_bc_n;
  %T_gh_sn(:,2) = 2*T_bc_n-T(:,ny-1);

end
