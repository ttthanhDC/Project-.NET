using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class ChiTietThu
    {
        public int ID { set; get; }
        public int IdNgayHD { set; get; }
        public Decimal SoTien { set; get; }
        public DateTime Ngay { set; get; }
        public DateTime NgayTao { set; get; }
        public string NguoiTao { set; get; }
        public int MaNganHang { set; get; }
        public string MaGiaoDich { set; get; }
        public int TinhTrang { set; get; }
        public int LoaiThu { set; get; }
        public string GhiChu { set; get; }
        public int IdKeToan { set; get; }
    }
}
