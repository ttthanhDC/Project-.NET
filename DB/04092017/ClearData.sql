
delete from HoaDon;
DBCC CHECKIDENT ('[HoaDon]', RESEED, 0)
delete from ChiTietHoaDon;
DBCC CHECKIDENT ('[ChiTietHoaDon]', RESEED, 0)
delete from PackageChiTietHoaDon;
DBCC CHECKIDENT ('[PackageChiTietHoaDon]', RESEED, 0)
delete from NgayHoaDon;
DBCC CHECKIDENT ('[NgayHoaDon]', RESEED, 0)
delete from HoaDonSanPham;
DBCC CHECKIDENT ('[HoaDonSanPham]', RESEED, 0)
delete from KhachHangNgay;
DBCC CHECKIDENT ('[KhachHangNgay]', RESEED, 0)
delete from SYS_CUSTOMER;
DBCC CHECKIDENT ('[SYS_CUSTOMER]', RESEED, 0)
delete from SHIPER;
DBCC CHECKIDENT ('[SHIPER]', RESEED, 0)
delete from LoTrinhShipper;
DBCC CHECKIDENT ('[LoTrinhShipper]', RESEED, 0)
delete from ChiTietChi;
DBCC CHECKIDENT ('[ChiTietChi]', RESEED, 0)
delete from ChiTietThu;
DBCC CHECKIDENT ('[ChiTietThu]', RESEED, 0)
delete from KeToan;
DBCC CHECKIDENT ('[KeToan]', RESEED, 0)
delete from LuuChuyenDongTien;
DBCC CHECKIDENT ('[LuuChuyenDongTien]', RESEED, 0)
ALTER TABLE SYS_BILL_MASTER DROP CONSTRAINT FK_SYS_BILL_MASTER_SYS_CUSTOMER