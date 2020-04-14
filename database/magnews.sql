-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 14, 2020 lúc 05:38 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `magnews`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_total` int(11) NOT NULL DEFAULT 0,
  `c_active` int(11) NOT NULL DEFAULT 0,
  `c_hot` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `c_show_home` tinyint(4) NOT NULL DEFAULT 1,
  `c_parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `c_name`, `c_slug`, `c_avatar`, `c_description`, `c_total`, `c_active`, `c_hot`, `created_at`, `updated_at`, `c_show_home`, `c_parent_id`) VALUES
(6, 'Công nghệ', 'cong-nghe', NULL, NULL, 0, 1, 1, '2020-03-24 06:17:18', '2020-03-29 21:50:58', 1, 0),
(7, 'Lập trình', 'lap-trinh', NULL, NULL, 0, 1, 0, '2020-03-24 06:17:39', '2020-03-29 21:28:13', 1, 0),
(8, 'Tools & Tips', 'tools-tips', NULL, NULL, 0, 1, 0, '2020-03-28 22:42:24', '2020-03-28 22:42:24', 1, NULL),
(9, 'Trải lòng coder', 'trai-long-coder', NULL, NULL, 0, 1, 0, '2020-03-28 22:43:10', '2020-03-28 22:43:10', 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2020_03_20_142331_create-categories-table', 1),
(29, '2020_03_24_092641_create_posts_table', 2),
(30, '2020_03_30_035937_add-home-to-categories', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_title_seo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_hot` tinyint(4) NOT NULL DEFAULT 0,
  `p_active` tinyint(4) NOT NULL DEFAULT 0,
  `p_description_seo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `p_view` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `p_name`, `p_slug`, `p_avatar`, `p_content`, `p_title_seo`, `p_hot`, `p_active`, `p_description_seo`, `p_category_id`, `p_view`, `created_at`, `updated_at`) VALUES
(3, 'Mời tải phần mềm bản quyền cực chất với tổng trị giá hơn 150 USD', 'moi-tai-phan-mem-ban-quyen-cuc-chat-voi-tong-tri-gia-hon-150-usd', '2020-03-29__moi-tai-phan-mem-ban-quyen-cuc-chat-voi-tong-tri-gia-hon-150-usd-696x522.jpg', '<p>\r\n\r\n<strong>Đến hẹn lại lên, mình tiếp tục chia sẻ những phần mềm bản quyền sẽ giúp máy tính chạy ổn định hơn tối ưu Windows, khá nhiều phần mềm diệt virus đang miễn phí 1 năm, phần mềm hỗ trợ chỉnh sửa video… . Hãy nhanh tay tải trước khi hết hạn nhé.</strong>\r\n\r\n<br></p><p><b></b>\r\n\r\n</p><p><b>1. Glary Utilities Pro (39.95 USD – 1 năm)</b></p><p><b>Glary Utilities Pro</b>&nbsp;là một phần mềm tối ưu hóa hệ thống khá toàn diện cho hệ điều hành Windows với nhiều công cụ mạnh mẽ và dễ dàng sử dụng được cung cấp. Nó được thiết kế bao gồm các công cụ hệ thống và tiện ích để sửa chữa chăm sóc hệ thống, tăng tốc độ và duy trì hiệu suất cao cho máy tính làm việc nhanh hơn. Phần mềm này được khá nhiều IT đánh giá cao.</p>\r\n\r\n\r\n\r\n<ul><li><b>Yêu cầu hệ thống: </b>Windows 10, Windows 8 / 8.1, Windows 7.</li><li>Bản quyền 1 năm</li></ul><p><b>Một số chức năng:</b></p><ul><li>Gỡ bỏ dữ liệu rác khỏi ổ đĩa và nhanh chóng lấy lại không gian cho nó.</li><li>Quét và dọn dẹp registry để cải thiện hiệu suất cho máy tính.</li><li>Sửa chữa các lỗi trong trình khởi động.</li><li>Tự động tối ưu máy tính của bạn.</li></ul><p><b>Hướng dẫn nhận bản quyền:</b></p><ul><li>Truy cập trang: <a target=\"_blank\" rel=\"nofollow\" href=\"https://sharewareonsale.com/s/glary-utilities-pro-sale\"><b>Give Away</b></a></li></ul>\r\n\r\n<br><p></p>', 'Mời tải phần mềm bản quyền cực chất với tổng trị giá hơn 150 USD', 1, 1, 'Mời tải phần mềm bản quyền cực chất với tổng trị giá hơn 150 USD', 6, 0, '2020-03-29 08:17:52', '2020-03-29 08:17:52'),
(4, 'Những công cụ Python tốt nhất dành cho Machine Learning và Data Science', 'nhung-cong-cu-python-tot-nhat-danh-cho-machine-learning-va-data-science', '2020-03-30__cong-cu-python-0.jpg', '<p>\r\n\r\n<strong>Ngôn ngữ lập trình Python có rất nhiều thư viện và framework lớn thuận lợi cho việc viết code và phát triển khoa học máy tính. Python vốn là ngôn ngữ nổi tiếng về sự đơn giản không cầu kỳ, code dễ học, dễ đọc, cú pháp logic và ngắn gọn, còn Machine Learning liên quan đến các thuật toán cực kỳ phức tạp và quy trình làm việc nhiều giai đoạn nên ở đây, sự logic ngắn gọn và dễ dàng của Python đóng vai trò quan trọng trong việc tiết kiệm thời gian của các nhà phát triển.</strong>\r\n\r\n<br></p><p>\r\n\r\nMặt khác, khi nói đến <strong>Data Science (Khoa học dữ liệu)</strong>, Python cũng có các package đặc biệt dành cho các công việc lĩnh vực này như SciPy, NumPy hay Pandas tạo điều kiện cho việc phân tích dữ liệu và có thể dễ dàng tích hợp với các ứng dụng web.\r\n\r\n<br></p><p>\r\n\r\n</p><p>Thêm nữa, Python đích thực là ngôn ngữ mã nguồn mở, bạn có thể tự do sử dụng và phân phối Python, thậm chí là dùng cho mục đích thương mại. Nhờ vậy mà Python có rất nhiều tài nguyên và tài liệu chất lượng cao cùng cộng đồng các nhà phát triển tích cực sẵn sàng cung cấp lời khuyên và hỗ trợ trong tất cả các giai đoạn của quá trình phát triển.</p><p>Vì vậy Quantrimang mời bạn cùng thảo luận về một số công cụ Python hữu ích cho cả ứng dụng Machine Learning và Data Science.</p>\r\n\r\n<br><p></p>', 'Những công cụ Python tốt nhất dành cho Machine Learning và Data Science', 1, 1, 'Những công cụ Python tốt nhất dành cho Machine Learning và Data Science', 6, 0, '2020-03-29 20:28:05', '2020-03-29 20:28:05'),
(5, 'Hành trình từ nữ công nhân nhà máy Trung Quốc đến kỹ sư Google của cô gái trẻ Sun Ling', 'hanh-trinh-tu-nu-cong-nhan-nha-may-trung-quoc-den-ky-su-google-cua-co-gai-tre-sun-ling', '2020-03-30__hanh-trinh-tu-nu-cong-nhan-nha-may-trung-quoc-den-ky-su-google-cua-co-gai-tre-sun-ling-696x522.jpg', '<p>\r\n\r\n<strong>Câu chuyện của Sun Ling được biết đến khi cô đăng câu trả lời trên diễn đàn Zhihu, phiên bản tiếng Trung của Quora cho chủ đề “Làm thế nào để tiếp cận với nền giáo dục nước ngoài nếu như bạn nghèo khó?”</strong>\r\n\r\n<br></p><p>\r\n\r\n</p><p>Hành trình 10 năm mà cô kể lại đã nhận được hơn 35.000 lượt thích trên Zhihu, sau đó tiếp tục trở thành hiện tượng trên Wechat vơi hơn 100.000 lượt xem.</p><p>Sun sinh năm 1990, trong một gia đình thuần nông ở ngôi làng nhỏ thuộc tình Hồ Nam, Trung Quốc. Hoàn cảnh khó khăn, mẹ cô thậm chí từng phải bán máu để lấy tiền nuôi gia đình. Năm 13 tuổi, Sun phải tạm thời nghỉ học để giảm bớt gánh nặng tài chính cho gia đình, cũng là tạo điều kiện tốt hơn cho anh trai, người con trai duy nhất trong nhà.</p>\r\n\r\n\r\n\r\n<p><em>Tôi đã luôn cầu xin cho đến khi cha cho phép tôi trở lại trường học. Tuy nhiên, thành thật mà nói, mong muốn mạnh mẽ của tôi để trở lại trường vào lúc đó chủ yếu là do công việc làm nông quá khó khăn. Tay tôi vẫn còn hằn lên những vết chai.</em>“, Sun chia sẻ với tờ South Morning China Post.</p><p><strong>Từ một công nhân nhà máy</strong></p><p>Trong nhóm bạn học ở làng, Sun là người duy nhất hoàn thành cấp trung học nhưng những gì nhận được từ môi trường giáo dục nông thôn nghèo nàn, cánh cửa đại học vẫn không mở ra với cô.</p><p>Vậy là giống như những người bạn đồng trang lứa khác, cô trở thành một công nhân nhà máy. Nhưng đối với cô gái 19 tuổi, nhà máy khi ấy giống như một thiết bị khổng lồ và không bao giờ ngừng hoạt động, cô thì thường xuyên bị sắp xếp làm ca đêm.</p><p><em>“Lặp đi lặp lại 12 giờ mỗi ngày để làm những việc mà tôi không thích, tôi tin chắc rằng đây không phải cuộc sống mà mình muốn.”,</em>&nbsp;Sun chia sẻ. Sau 8 tháng, Sun bỏ việc và đăng kí vào một chương trình đào tạo máy tính.</p><p>Để đủ tiền trang trải cho việc học, Sun làm thêm 3 công việc parttime cùng lúc. Cuộc sống của cô khi ấy xoay quanh việc giao các tờ quảng cáo và làm phục vụ tại các nhà hàng, bên cạnh khoản nợ từ 3 thẻ tín dụng.</p><p><strong>… đến một cô nhân viên văn phòng tại Thâm Quyến…</strong></p><div><div></div><div></div><div></div></div><p>Sau hơn một năm đào tạo cùng số nợ 10.000 nhân dân tệ (1.450 USD), vào tháng 9 năm 2011, cô được thuê làm kỹ sư phần mềm bởi một công ty Thâm Quyến, chịu trách nhiệm phát triển hệ thống bảng lương trực tuyến. Với kỹ năng của mình, Sun nhận  mức lương 4.000 nhân dân tệ mỗi tháng, đáp ứng được kỳ vọng của bản thân với tư cách một “nữ nhân viên văn phòng”.</p><p>Nhưng sự phấn khích và hài lòng ấy không duy trì được lâu. Cô bắt đầu cảm thấy mình nhỏ bé trong một thành phố lớn, “nơi mà mọi người khác đều rất xuất sắc, với những tấm bằng cấp đáng ngưỡng mộ”.</p><p>Sun nghĩ mình phải tiếp tục học thêm. Cô đã đăng ký một chương trình đào tạo tiếng Anh và một chương trình đường dài để kiếm được tấm bằng từ Đại học Thâm Quyến. Tất cả điều này diễn ra trong khi cô gái ấy vẫn duy trì công việc kỹ thuật phần mềm của mình.</p>\r\n\r\n<br><p></p>', 'Hành trình từ nữ công nhân nhà máy Trung Quốc đến kỹ sư Google của cô gái trẻ Sun Ling', 1, 1, 'Hành trình từ nữ công nhân nhà máy Trung Quốc đến kỹ sư Google của cô gái trẻ Sun Ling', 6, 0, '2020-03-29 20:30:19', '2020-03-29 20:30:19'),
(6, 'Hacker khoe dữ liệu của 41 triệu người dùng Facebook Việt Nam', 'hacker-khoe-du-lieu-cua-41-trieu-nguoi-dung-facebook-viet-nam', '2020-03-30__hacker-khoe-du-lieu-cua-41-trieu-nguoi-dung-facebook-viet-nam-696x522.jpg', '<p>\r\n\r\n<strong>Ngày 24/3, tài khoản V** trên diễn đàn Rapid**** đăng tải thông tin được cho là của hơn 41 triệu người dùng Facebook tại Việt Nam.</strong>\r\n\r\n<br></p><p>\r\n\r\n</p><p>Những thông tin này bao gồm trường học, công việc, địa chỉ, tên tuổi và ID Facebook. Tất cả đều được thể hiện chi tiết bằng tiếng Việt.</p><p>Theo đó, thành viên diễn đàn sẽ mất 8 điểm tín dụng để tải kho dữ liệu trên. Thư mục tải về có định dạng “.txt” với các thông tin không được mã hóa.</p>\r\n\r\n\r\n\r\n<p>Đây là những thông tin người dùng cung cấp công khai cho Facebook, được tổng hợp lại. Tuy vậy, các file dữ liệu được phân loại theo nhóm dựa trên sở thích của người dùng như học tập, làm việc, thể thao… với dung lượng trên 20 GB.</p><p>Diễn đàn Raid*** là nơi đăng tải dữ liệu người dùng mà các hacker có được khi xâm nhập vào nhiều nền tảng khác nhau. Trước đây, 3 triệu dữ liệu chủ tài khoản của một ngân hàng Việt Nam hay khách hàng của các chuỗi bán lẻ smartphone cũng xuất hiện trên diễn đàn này.</p><p>Hiện liên kết tải 41 triệu dữ liệu người dùng Facebook Việt Nam đã bị xóa khỏi diễn đàn. Tuy vậy, những người nhanh tay tải xuống dữ liệu từ ngày 24/3 vẫn có thể truy cập thông tin người dùng Facebook Việt Nam.</p><p>Tháng 9/2019, một máy chủ chứa dữ liệu của hơn 419 triệu người dùng Facebook đã bị rò rỉ. Trong số đó có hơn 50 triệu dữ liệu người dùng tại Việt Nam. Nhiều quốc gia như Anh, Mỹ, Brazil… đã phạt Facebook hàng triệu USD. Tuy vậy, án phạt này đối với Facebook như “muối bỏ bể”.</p>\r\n\r\n<br><p></p>', 'Hacker khoe dữ liệu của 41 triệu người dùng Facebook Việt Nam', 1, 1, 'Hacker khoe dữ liệu của 41 triệu người dùng Facebook Việt Nam', 6, 0, '2020-03-29 20:31:37', '2020-03-29 20:31:37'),
(7, 'Giới thiệu về kiểu dữ liệu char trong C++', 'gioi-thieu-ve-kieu-du-lieu-char-trong-c', '2020-03-30__gioi-thieu-ve-kieu-du-lieu-char-trong-c-696x522.jpg', NULL, 'Giới thiệu về kiểu dữ liệu char trong C++', 1, 1, 'Giới thiệu về kiểu dữ liệu char trong C++', 7, 0, '2020-03-29 20:34:26', '2020-03-29 20:34:26'),
(8, '5 ý tưởng thiết kế cơ bản không thể thiếu cho các Dev Frontend', '5-y-tuong-thiet-ke-co-ban-khong-the-thieu-cho-cac-dev-frontend', '2020-03-30__5leg9vwn33m2v894gtba-696x465.jpeg', '<p>\r\n\r\n</p><p>Là 1 nhà thiết kế đồ họa, đắm mình vào việc gõ code làm cho mình có 1 chút nản chí và còn cảm thấy tí đáng sợ nữa. Quá trình coding của mình là 1 câu chuyện khá là khác lạ. Mình bắt đầu dự án của mình với suy nghĩ của 1 người khách hàng. Bằng cách như vậy, mình có thể định dạng được phông nền của ứng dụng mình làm và tìm ra chức năng gì mình có thể thêm vào. Từ đó, mình tạo ra wireframe. Cái wireframe này đã cho phép mình thấy các layout của những ứng dụng mà mình tạo. Sau đó, mình bắt đầu tập code. Mình bắt đầu bằng cách dựng chức năng và test xem nếu tất cả chúng nó có hoạt động ổn không. Cuối cùng, mình bắt đầu code phần frontend và sử dụng các framework CSS khác nhau để thiết kế các ứng dụng của bản thân. </p><p>Bên dưới là các ý tưởng mà mình đã ứng dụng vào thiết kế của mình.</p>\r\n\r\n\r\n\r\n<h3>2. Composition</h3><h4>Composition là khi các yếu tố được sắp xếp để nhìn theo 1 cách nhất định. Mình có 1 ý tưởng bạn nên làm quen bản thân với grid system. Nó được dùng với hầu hết các framework CSS, như Bootstrap và Foundation. Có độ tương phản với kích thước và màu sắc để giúp thông tin liền mạch hơn. Cách tốt nhất là bạn nên có 1 tiêu điểm để sản phẩm của bạn được nhìn và cảm giác có ý nghĩa hơn. Hãy xem thử <a target=\"_blank\" rel=\"nofollow\" href=\"https://99designs.com/blog/tips/design-composition-and-layout/\">blog này</a>&nbsp;để hiểu rõ hơn về composition.</h4>\r\n\r\n<br><p></p>', '5 ý tưởng thiết kế cơ bản không thể thiếu cho các Dev Frontend', 1, 1, '5 ý tưởng thiết kế cơ bản không thể thiếu cho các Dev Frontend', 7, 0, '2020-03-29 20:35:34', '2020-03-29 20:35:34'),
(9, '3 lý do macOS tốt cho lập trình hơn Windows', '3-ly-do-macos-tot-cho-lap-trinh-hon-windows', '2020-03-30__3-ly-do-macos-tot-cho-lap-trinh-hon-windows-696x522.jpg', '<p>\r\n\r\n</p><p>Tuy nhiên, một yếu tố quan trọng cần xem xét là sở thích cá nhân. Đối với bất kỳ lập trình viên nào, điều quan trọng là được làm việc với một chiếc máy mà họ cảm thấy thoải mái.</p><p>Nhiều lập trình viên đã làm việc với cả hai hệ điều hành Mac OS X và Windows. Họ đã hiểu được tại sao nhiều người lại thích MacBook hơn.</p>\r\n\r\n\r\n\r\n<h2>1. Xem xét UNIX, LINUX và Mac</h2><p>UNIX và LINUX là các hệ điều hành rất quan trọng đối với việc lập trình. Nếu mới làm quen với thế giới lập trình, bạn chắc chắn đã nghe về chúng. UNIX xuất hiện đầu tiên, sau đó là LINUX. Lý do tại sao hai nền tảng này lý tưởng cho các lập trình viên là: UNIX cung cấp rất nhiều sự ổn định, tính linh hoạt và nó cũng rất bảo mật. Hầu hết các trang web chúng ta sử dụng và truy cập thường xuyên được xây dựng trên nền tảng UNIX và Linux đều dựa trên những yếu tố này.</p>\r\n\r\n<br><p></p>', '3 lý do macOS tốt cho lập trình hơn Windows', 1, 1, '3 lý do macOS tốt cho lập trình hơn Windows', 7, 0, '2020-03-29 20:36:22', '2020-03-29 20:36:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_c_name_unique` (`c_name`),
  ADD KEY `categories_c_slug_index` (`c_slug`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_p_slug_unique` (`p_slug`),
  ADD KEY `posts_p_name_index` (`p_name`),
  ADD KEY `p_category_id` (`p_category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`p_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
