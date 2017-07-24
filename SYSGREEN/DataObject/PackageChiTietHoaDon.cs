using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class PackageChiTietHoaDon
    {

        public int ID { get; set; }
        public int IDChiTietHD { get; set; }
        public int SoNgay { get; set; }
        public int Loai { get; set; }
        public String TrangThai { get; set; }
        public String Ship { get; set; }
        public String HinhThucThanhToan { get; set; }
        public String HinhThucGiaoHang { get; set; }
        public Decimal ThanhTien { get; set; }
    }
}
