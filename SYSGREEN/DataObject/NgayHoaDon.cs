using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class NgayHoaDon
    {
        public int ID { set; get; }
        public int IDPackageChitietHD { set; get; }
        public DateTime Ngay { set; get; }
        public string TrangThai { set; get; }

        public int USER_ID { set; get; }

        public int SHIPER_ID { set; get; }

        public string GhiChu { set; get; }

        public Decimal TongTien { set; get; }

        public Decimal SoTienThu { set; get; }

        public Decimal SoTienConLai { set; get; }
    }
}
