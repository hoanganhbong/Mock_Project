

ALTER TRIGGER [dbo].[TINHDEIMTOHOP] ON [dbo].[LICHCN]
FOR UPDATE
AS
BEGIN
--khoi d
DECLARE @diemd DECIMAL(4,1),@scmnd  char(12)
select @scmnd=scmnd from inserted 
SELECT @diemd=SUM(diem) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','VAN','ANH') 
AND (SELECT COUNT(*) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','VAN','ANH')  )=3
IF(@diemd>0)
IF(NOT EXISTS (SELECT *FROM [dbo].[DIEMTOHOP] WHERE scmnd=@scmnd and makhoi='D'))
BEGIN
	INSERT INTO [dbo].[DIEMTOHOP] VALUES(@scmnd,'D',@diemd)
	 DECLARE @diemtongD DECIMAL(4,1)=@diemd, @makhoiD nchar(3), @scmndD  char(12)=@scmnd
		declare @kqD nchar(5),@manganhD char(10)
		declare @diemnganhD decimal(4,1)
		declare @demD int
		declare @nvD char(3)
		declare @nvsD char(3)
		declare @matruongD char(3)
	 select @makhoiD ='D'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndD
		open contro
		
		fetch next from contro into @nvsD --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvD =@nvsD
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvD and smcnd=@scmndD))
						begin
						
							select @manganhD=manganh,@matruongD=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvD and scmnd=@scmndD
							select @demD=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiD and manganh=@manganhD
							
							if(@demD=1)
							begin
								
								select @diemnganhD=diem from dbo.TUYENSINH_DH where manganh=@manganhD AND matruong=@matruongD
								SELECT @diemtongD,@diemnganhD
								if(@diemtongD>=@diemnganhD)
								begin
									select @kqD=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndD,@kqD,@nvD)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsD
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
END
ELSE
BEGIN
	UPDATE [dbo].[DIEMTOHOP] SET tongdiem=@diemd WHERE scmnd=@scmnd AND makhoi='D'
	 DECLARE @diemtongDD DECIMAL(4,1)=@diemd, @makhoiDD nchar(3), @scmndDD  char(12)=@scmnd
		declare @kqDD nchar(5),@manganhDD char(10)
		declare @diemnganhDD decimal(4,1)
		declare @demDD int
		declare @nvDD char(3)
		declare @nvsDD char(3)
		declare @matruongDD char(3)
	 select @makhoiDD ='D'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndDD
		open contro
		
		fetch next from contro into @nvsDD --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvDD =@nvsDD
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvDD and smcnd=@scmndDD))
						begin
						
							select @manganhDD=manganh,@matruongDD=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvDD and scmnd=@scmndDD
							select @demDD=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiDD and manganh=@manganhDD
							
							if(@demDD=1)
							begin
								
								select @diemnganhDD=diem from dbo.TUYENSINH_DH where manganh=@manganhDD AND matruong=@matruongDD
								SELECT @diemtongDD,@diemnganhDD
								if(@diemtongDD>=@diemnganhDD)
								begin
									select @kqDD=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndDD,@kqDD,@nvDD)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsDD
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
END

--diem a
DECLARE @diemA DECIMAL(4,1)
SELECT @diema=SUM(diem) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','LY','HOA') 
AND (SELECT COUNT(*) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','LY','HOA')  )=3
IF(@DIEMa>0)
IF(NOT EXISTS (SELECT *FROM [dbo].[DIEMTOHOP] WHERE scmnd=@scmnd and makhoi='A'))
begin
	INSERT INTO [dbo].[DIEMTOHOP] VALUES(@scmnd,'A',@diema)
	 DECLARE @diemtongA DECIMAL(4,1)=@diema, @makhoiA nchar(3), @scmndA  char(12)=@scmnd
		declare @kqA nchar(5),@manganhA char(10)
		declare @diemnganhA decimal(4,1)
		declare @demA int
		declare @nvA char(3)
		declare @nvsA char(3)
		declare @matruongA char(3)

	 select @makhoiA ='A'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndA
		open contro
		
		fetch next from contro into @nvsA --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvA =@nvsA
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvA and smcnd=@scmndA))
						begin
						
							select @manganhA=manganh,@matruongA=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvA and scmnd=@scmndA
							select @demA=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiA and manganh=@manganhA
							
							if(@demA=1)
							begin
								
								select @diemnganhA=diem from dbo.TUYENSINH_DH where manganh=@manganhA and matruong=@matruongA
								SELECT @diemtongA,@diemnganhA
								if(@diemtongA>=@diemnganhA)
								begin
									select @kqA=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndA,@kqA,@nvA)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsA
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
	
end
ELSE
BEGIN
	UPDATE [dbo].[DIEMTOHOP] SET tongdiem=@diema WHERE scmnd=@scmnd AND makhoi='A'
	 DECLARE @diemtongAA DECIMAL(4,1)=@diema, @makhoiAA nchar(3), @scmndAA  char(12)=@scmnd
		declare @kqAA nchar(5),@manganhAA char(10)
		declare @diemnganhAA decimal(4,1)
		declare @demAA int
		declare @nvAA char(3)
		declare @nvsAA char(3)
		declare @matruongAA char(3)
	 select @makhoiAA ='A'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndAA
		open contro
		
		fetch next from contro into @nvsAA --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvAA =@nvsAA
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvAA and smcnd=@scmndAA))
						begin
						
							select @manganhAA=manganh,@matruongAA=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvAA and scmnd=@scmndAA
							select @demAA=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiAA and manganh=@manganhAA
							
							if(@demAA=1)
							begin
								
								select @diemnganhAA=diem from dbo.TUYENSINH_DH where manganh=@manganhAA  and matruong=@matruongAA
								SELECT @diemtongAA,@diemnganhAA
								if(@diemtongAA>=@diemnganhAA)
								begin
									select @kqAA=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndAA,@kqAA,@nvAA)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsA
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
	
END
--diem b
DECLARE @diemb DECIMAL(4,1)
SELECT @diemb=SUM(diem) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','SINH','HOA') 
AND (SELECT COUNT(*) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','SINH','HOA')  )=3
IF(@DIEMb>0)
IF(NOT EXISTS (SELECT *FROM [dbo].[DIEMTOHOP] WHERE scmnd=@scmnd and makhoi='B'))
begin
	INSERT INTO [dbo].[DIEMTOHOP] VALUES(@scmnd,'B',@DIEMb)
	 DECLARE @diemtongB DECIMAL(4,1)=@DIEMb, @makhoiB nchar(3), @scmndB  char(12)=@scmnd
		declare @kqB nchar(5),@manganhB char(10)
		declare @diemnganhB decimal(4,1)
		declare @demB int
		declare @nvB char(3)
		declare @nvsB char(3)
		declare @matruongB char(3)
	 select @makhoiB ='B'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndB
		open contro
		
		fetch next from contro into @nvsB --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvB =@nvsB
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvB and smcnd=@scmndB))
						begin
						
							select @manganhB=manganh,@matruongB=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvB and scmnd=@scmndB
							select @demB=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiB and manganh=@manganhB
							
							if(@demB=1)
							begin
								
								select @diemnganhB=diem from dbo.TUYENSINH_DH where manganh=@manganhB AND matruong=@matruongB
								SELECT @diemtongB,@diemnganhB
								if(@diemtongB>=@diemnganhB)
								begin
									select @kqB=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndB,@kqB,@nvB)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsB
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
		
	
	
end
ELSE
begin
	UPDATE [dbo].[DIEMTOHOP] SET tongdiem=@DIEMb WHERE scmnd=@scmnd AND makhoi='B'
	 DECLARE @diemtongBB DECIMAL(4,1)=@DIEMb, @makhoiBB nchar(3), @scmndBB  char(12)=@scmnd
		declare @kqBB nchar(5),@manganhBB char(10)
		declare @diemnganhBB decimal(4,1)
		declare @demBB int
		declare @nvBB char(3)
		declare @nvsBB char(3)
		declare @matruongBB char(3)
	 select @makhoiBB ='B'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndBB
		open contro
		
		fetch next from contro into @nvsBB --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvBB =@nvsBB
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvBB and smcnd=@scmndBB))
						begin
						
							select @manganhBB=manganh,@matruongBB=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvBB and scmnd=@scmndBB
							select @demBB=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiBB and manganh=@manganhBB
							
							if(@demBB=1)
							begin
								
								select @diemnganhBB=diem from dbo.TUYENSINH_DH where manganh=@manganhBB AND matruong=@matruongBB
								SELECT @diemtongBB,@diemnganhBB
								if(@diemtongBB>=@diemnganhBB)
								begin
									select @kqBB=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndBB,@kqBB,@nvBB)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsBB
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
end
--diem c
DECLARE @diemc DECIMAL(4,1)=0
SELECT @diemc=SUM(diem) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('VAN','SU','DIA') 
AND (SELECT COUNT(*) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('VAN','SU','DIA')  )=3
IF(@DIEMc>0)
IF(NOT EXISTS (SELECT *FROM [dbo].[DIEMTOHOP] WHERE scmnd=@scmnd and makhoi='C'))
begin
	INSERT INTO [dbo].[DIEMTOHOP] VALUES(@scmnd,'C',@DIEMC)
	 DECLARE @diemtongC DECIMAL(4,1)=@DIEMC, @makhoiC nchar(3), @scmndC  char(12)=@scmnd
		declare @kqC nchar(5),@manganhC char(10)
		declare @diemnganhC decimal(4,1)
		declare @demC int
		declare @nvC char(3)
		declare @nvsC char(3)
		declare @matruongC char(3)
	 select @makhoiC ='C'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndC
		open contro
		
		fetch next from contro into @nvsC --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvC =@nvsC
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvC and smcnd=@scmndC))
						begin
						
							select @manganhC=manganh,@matruongC=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvC and scmnd=@scmndC
							select @demC=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiC and manganh=@manganhC
							
							if(@demC=1)
							begin
								
								select @diemnganhC=diem from dbo.TUYENSINH_DH where manganh=@manganhC AND matruong=@matruongC
								SELECT @diemtongC,@diemnganhC
								if(@diemtongC>=@diemnganhC)
								begin
									select @kqC=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndC,@kqC,@nvC)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsC
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
end
ELSE
begin
	UPDATE [dbo].[DIEMTOHOP] SET tongdiem=@DIEMC WHERE scmnd=@scmnd AND makhoi='C'
		 DECLARE @diemtongCC DECIMAL(4,1)=@DIEMC, @makhoiCC nchar(3), @scmndCC  char(12)=@scmnd
		declare @kqCC nchar(5),@manganhCC char(10)
		declare @diemnganhCC decimal(4,1)
		declare @demCC int
		declare @nvCC char(3)
		declare @nvsCC char(3)
		declare @matruongCC char(3)
	 select @makhoiCC ='C'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndCC
		open contro
		
		fetch next from contro into @nvsCC --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvCC =@nvsCC
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvCC and smcnd=@scmndCC))
						begin
						
							select @manganhCC=manganh,@matruongCC=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvCC and scmnd=@scmndCC
							select @demCC=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiCC and manganh=@manganhCC
							
							if(@demCC=1)
							begin
								
								select @diemnganhCC=diem from dbo.TUYENSINH_DH where manganh=@manganhCC AND matruong=@makhoiCC
								SELECT @diemtongCC,@diemnganhCC
								if(@diemtongCC>=@diemnganhCC)
								begin
									select @kqCC=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndCC,@kqCC,@nvCC)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsCC
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
end
--KHOI A1
DECLARE @diemA1 DECIMAL(4,1)=0
SELECT @diemA1=SUM(diem) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','LY','ANH') 
AND (SELECT COUNT(*) FROM [dbo].[LICHCN] T WHERE T.scmnd=@scmnd AND mamon IN ('TOAN','LY','ANH')  )=3
IF(@diemA1>0)
IF(NOT EXISTS (SELECT *FROM [dbo].[DIEMTOHOP] WHERE scmnd=@scmnd and makhoi='A1'))
begin
		INSERT INTO [dbo].[DIEMTOHOP] VALUES(@scmnd,'A1',@diemA1)
		 DECLARE @diemtongA1 DECIMAL(4,1)=@diemA1, @makhoiA1 nchar(3), @scmndA1  char(12)=@scmnd
		declare @kqA1 nchar(5),@manganhA1 char(10)
		declare @diemnganhA1 decimal(4,1)
		declare @demA1 int
		declare @nvA1 char(3)
		declare @nvsA1 char(3)
		declare @matruongA1 char(3)
	 select @makhoiA1 ='A1'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndA1
		open contro
		
		fetch next from contro into @nvsA1 --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvA1 =@nvsA1
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvA1 and smcnd=@scmndA1))
						begin
						
							select @manganhA1=manganh,@matruongA1=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvA1 and scmnd=@scmndA1
							select @demA1=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiA1 and manganh=@manganhA1
							
							if(@demA1=1)
							begin
								
								select @diemnganhA1=diem from dbo.TUYENSINH_DH where manganh=@manganhA1 AND matruong=@matruongA1
								SELECT @diemtongA1,@diemnganhA1
								if(@diemtongA1>=@diemnganhA1)
								begin
									select @kqA1=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndA1,@kqA1,@nvA1)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsA1
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
		
end
ELSE
begin
	UPDATE [dbo].[DIEMTOHOP] SET tongdiem=@diemA1 WHERE scmnd=@scmnd AND makhoi='A1'
	 DECLARE @diemtongA11 DECIMAL(4,1)=@diemA1, @makhoiA11 nchar(3), @scmndA11  char(12)=@scmnd
		declare @kqA11 nchar(5),@manganhA11 char(10)
		declare @diemnganhA11 decimal(4,1)
		declare @demA11 int
		declare @nvA11 char(3)
		declare @nvsA11 char(3)
		declare @matruongA11 char(3)
	 select @makhoiA11 ='A1'
	 declare contro cursor
		for select nguyenvong from dbo.NGUYENVONG_THISINH where scmnd=@scmndA11
		open contro
		
		fetch next from contro into @nvsA11 --dua con tro tro ve dong dau tien
		while(@@FETCH_STATUS=0) -- neu tro thanh cong tra ve 0 con lai tra ve khac 0
			begin
			
					--thuc hien cong viec gi do
						SELECT @nvA11 =@nvsA11
						
						if(not EXISTS (select nguyenvong from dbo.KETQUA where  nguyenvong=@nvA11 and smcnd=@scmndA11))
						begin
						
							select @manganhA11=manganh,@matruongA11=matruong from dbo.NGUYENVONG_THISINH where nguyenvong=@nvA11 and scmnd=@scmndA11
							select @demA11=COUNT(*) from  dbo.KHOI_NGANH where makhoi=@makhoiA11 and manganh=@manganhA11
							
							if(@demA11=1)
							begin
								
								select @diemnganhA11=diem from dbo.TUYENSINH_DH where manganh=@manganhA11 AND matruong=@matruongA11
								SELECT @diemtongA11,@diemnganhA11
								if(@diemtongA11>=@diemnganhA11)
								begin
									select @kqA11=N'ĐẬU'
									insert into dbo.KETQUA values(@scmndA11,@kqA11,@nvA11)
								end
							end
						end
						--end 1 nguyen vong 
					--ket thuc cong viec
					fetch next from contro into @nvsA11
			end
		close contro --dong con tro
		deallocate contro -- giai phong con tro
		
end
END