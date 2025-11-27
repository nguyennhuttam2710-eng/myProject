
CREATE TABLE Users (
    UserId INT IDENTITY PRIMARY KEY NOT NULL,
    FullName NVARCHAR(100),
    Email NVARCHAR(100) NOT NULL,
    UserPassword NVARCHAR(100) NOT NULL
);

CREATE TABLE Admins (
    AdminId INT IDENTITY PRIMARY KEY NOT NULL,
    FullName NVARCHAR(100),
    Username NVARCHAR(100) NOT NULL,
    AdminPassword NVARCHAR(100) NOT NULL
);

CREATE TABLE News (
    NewsId INT IDENTITY PRIMARY KEY NOT NULL,
    Header NVARCHAR(200) NULL,
    Content NVARCHAR(MAX) NULL,
    Posted DATETIME DEFAULT GETDATE() NOT NULL,
    AdminId INT FOREIGN KEY REFERENCES Admins(AdminId)
);

CREATE TABLE UserSave (
    SaveId INT IDENTITY PRIMARY KEY NOT NULL,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    NewsId INT FOREIGN KEY REFERENCES News(NewsId),
    Saved DATETIME DEFAULT GETDATE()
);

INSERT INTO News (Header, Content, Posted, AdminId) VALUES
(N'Kinh tế Việt Nam tăng trưởng trở lại',
 N'Các chuyên gia cho biết kinh tế Việt Nam tiếp tục tăng trưởng ổn định nhờ xuất khẩu và đầu tư nước ngoài.',
 DATEADD(DAY, -1, GETDATE()), 1),

(N'Giá xăng giảm nhẹ trong tuần này',
 N'Giá xăng dầu có xu hướng giảm nhẹ do ảnh hưởng của thị trường thế giới.',
 DATEADD(DAY, -2, GETDATE()), 1),

(N'Đội tuyển bóng đá Việt Nam tập trung chuẩn bị giải đấu',
 N'HLV trưởng chia sẻ tinh thần của toàn đội đang rất tốt, hướng tới kết quả khả quan.',
 DATEADD(DAY, -3, GETDATE()), 1),

(N'Thời tiết miền Bắc chuyển lạnh',
 N'Nhiều nơi nhiệt độ giảm mạnh, người dân cần chú ý giữ ấm cơ thể.',
 DATEADD(DAY, -4, GETDATE()), 1),

(N'Giá vàng thế giới tăng cao',
 N'Giá vàng tăng liên tục do biến động kinh tế toàn cầu.',
 DATEADD(DAY, -5, GETDATE()), 1),

(N'Samsung ra mắt dòng điện thoại mới',
 N'Dòng sản phẩm mới hứa hẹn hiệu năng mạnh và camera được nâng cấp.',
 DATEADD(DAY, -6, GETDATE()), 1),

(N'Apple chuẩn bị tổ chức sự kiện đặc biệt',
 N'Nhiều tin đồn về các sản phẩm mới khiến cộng đồng công nghệ xôn xao.',
 DATEADD(DAY, -7, GETDATE()), 1),

(N'Viettel công bố gói dữ liệu ưu đãi',
 N'Khách hàng sẽ được hưởng dung lượng lớn với giá thành giảm.',
 DATEADD(DAY, -8, GETDATE()), 1),

(N'Cảnh báo nắng nóng tại miền Trung',
 N'Cơ quan khí tượng cho biết nhiều khu vực ghi nhận nền nhiệt cao.',
 DATEADD(DAY, -9, GETDATE()), 1),

(N'TP.HCM khai trương trung tâm thương mại mới',
 N'Nhiều thương hiệu lớn tham gia và thu hút đông đảo người dân.',
 DATEADD(DAY, -10, GETDATE()), 1),

(N'Phim hành động mới phá kỷ lục doanh thu',
 N'Bộ phim thu hút lượng lớn khán giả trẻ nhờ kỹ xảo đẹp mắt.',
 DATEADD(DAY, -11, GETDATE()), 1),

(N'Tập thể dục buổi sáng mang lại lợi ích bất ngờ',
 N'Nhiều nghiên cứu chỉ ra rằng vận động nhẹ buổi sáng giúp cải thiện sức khỏe tổng thể.',
 DATEADD(DAY, -12, GETDATE()), 1),

(N'Chứng khoán tăng mạnh đầu phiên',
 N'Cổ phiếu nhóm ngân hàng dẫn đầu đà tăng.',
 DATEADD(DAY, -13, GETDATE()), 1),

(N'Cầu vượt mới tại Hà Nội chính thức thông xe',
 N'Dự án giúp giảm tải ùn tắc giao thông khu vực nội đô.',
 DATEADD(DAY, -14, GETDATE()), 1),

(N'Trường đại học công bố chương trình học bổng mới',
 N'Hàng trăm sinh viên được trao cơ hội học tập và nghiên cứu.',
 DATEADD(DAY, -15, GETDATE()), 1),

(N'Nông sản Việt Nam tăng xuất khẩu sang châu Âu',
 N'Nhiều mặt hàng đạt tiêu chuẩn chất lượng cao hơn.',
 DATEADD(DAY, -16, GETDATE()), 1),

(N'Google cập nhật thuật toán tìm kiếm',
 N'Nhiều website ghi nhận biến động mạnh trong thứ hạng.',
 DATEADD(DAY, -17, GETDATE()), 1),

(N'Xe điện ngày càng phổ biến tại Việt Nam',
 N'Các hãng xe đồng loạt giới thiệu nhiều mẫu mã mới.',
 DATEADD(DAY, -18, GETDATE()), 1),

(N'Giới trẻ quan tâm hơn đến sức khỏe tinh thần',
 N'Nhiều hoạt động cộng đồng được tổ chức nhằm nâng cao nhận thức.',
 DATEADD(DAY, -19, GETDATE()), 1),

(N'Lễ hội âm nhạc sắp diễn ra tại Đà Nẵng',
 N'Sự kiện dự kiến thu hút hàng nghìn người tham dự.',
 DATEADD(DAY, -20, GETDATE()), 1),

(N'Khởi nghiệp công nghệ: Xu hướng năm nay',
 N'Nhiều startup tập trung vào AI và tự động hóa.',
 DATEADD(DAY, -21, GETDATE()), 1),

(N'Giảm cân khoa học: Không cần nhịn ăn',
 N'Chuyên gia dinh dưỡng chia sẻ phương pháp an toàn và hiệu quả.',
 DATEADD(DAY, -22, GETDATE()), 1),

(N'Festival ẩm thực Việt Nam 2025',
 N'Nhiều món ăn truyền thống được tôn vinh và quảng bá.',
 DATEADD(DAY, -23, GETDATE()), 1),

(N'Công viên chủ đề mới khai trương',
 N'Nơi đây hứa hẹn trở thành điểm du lịch hấp dẫn.',
 DATEADD(DAY, -24, GETDATE()), 1),

(N'Bão số 3 chuẩn bị đổ bộ',
 N'Cơ quan chức năng cảnh báo người dân cần chủ động phòng tránh.',
 DATEADD(DAY, -25, GETDATE()), 1),

(N'Hàng không mở thêm nhiều đường bay mới',
 N'Nhằm phục vụ nhu cầu di chuyển tăng cao.',
 DATEADD(DAY, -26, GETDATE()), 1),

(N'Công nghệ AI trong giáo dục',
 N'Nhiều trường học bắt đầu ứng dụng trí tuệ nhân tạo trong giảng dạy.',
 DATEADD(DAY, -27, GETDATE()), 1),

(N'Thị trường bất động sản có dấu hiệu phục hồi',
 N'Nhiều dự án mới được triển khai trở lại.',
 DATEADD(DAY, -28, GETDATE()), 1),

(N'Sách điện tử ngày càng phổ biến',
 N'Người dùng thích đọc ebook vì tiện lợi và giá rẻ.',
 DATEADD(DAY, -29, GETDATE()), 1),

(N'Thể thao điện tử thu hút giới trẻ',
 N'Nhiều giải đấu eSports được tổ chức quy mô lớn.',
 DATEADD(DAY, -30, GETDATE()), 1);

