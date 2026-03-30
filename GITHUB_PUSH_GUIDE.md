# Quy Trình Upload Project Lên GitHub

## 1. Khởi tạo Git (Chỉ làm 1 lần cho mỗi project)

```bash
# Di chuyển vào thư mục project
cd duong-dan-den-project

# Khởi tạo git repository
git init
```

## 2. Thêm Remote (Chỉ làm 1 lần)

```bash
# Thêm remote origin (thay URL bằng repo của bạn)
git remote add origin https://github.com/username/repo-name.git

# Kiểm tra remote đã thêm chưa
git remote -v
```

## 3. Tạo File .gitignore (Nên làm trước khi add files)

Tạo file `.gitignore` để bỏ qua các file không cần thiết:

```
# Java/Maven
target/
*.class
*.jar
*.war

# IDE
.idea/
*.iml
.vscode/

# Environment
.env
*.env

# OS
.DS_Store
Thumbs.db

# Logs
*.log
```

## 4. Thêm và Commit Files

```bash
# Thêm tất cả files vào staging
git add .

# Hoặc thêm file cụ thể
git add README.md
git add src/

# Commit với message
git commit -m "Mô tả ngắn gọn thay đổi"
```

## 5. Push Lên GitHub

```bash
# Push lên branch main (lần đầu cần -u để set upstream)
git push -u origin main

# Các lần sau chỉ cần
git push origin main
```

---

## Khi Gặp Lỗi Thường Gặp

### Lỗi: "Updates were rejected because the remote contains work that you do not have locally"

```bash
# Cách 1: Pull về rồi push (giữ lịch sử remote)
git pull origin main --rebase
git push origin main

# Cách 2: Force push (ghi đè remote) - CẨN THẬN!
git push origin main --force
```

### Lỗi: Merge conflict

1. Mở file có conflict
2. Tìm và xóa các dòng `<<<<<<<`, `=======`, `>>>>>>>`
3. Giữ lại code bạn muốn
4. Save file
5. 
```bash
git add ten-file-co-conflict.txt
git commit -m "Resolve conflict"
git push origin main
```

### Lỗi: "Permission denied"

```bash
# Kiểm tra đã đăng nhập Git chưa
git config --list

# Nếu chưa, cấu hình credentials
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## Quy Trình Đầy Đủ (Từ Đầu)

```bash
# 1. Di chuyển vào thư mục project
cd duong-dan-den-project

# 2. Khởi tạo git
git init

# 3. Thêm remote (nếu chưa có)
git remote add origin https://github.com/username/repo-name.git

# 4. Tạo .gitignore (tùy chọn)
# Tạo file .gitignore với nội dung phù hợp

# 5. Thêm tất cả files
git add .

# 6. Commit
git commit -m "Initial commit"

# 7. Push lên GitHub
git push -u origin main
```

---

## Các Lệnh Hữu Ích

```bash
# Xem trạng thái
git status

# Xem danh sách commits
git log --oneline

# Xem remote hiện tại
git remote -v

# Xem branch hiện tại
git branch

# Xem tất cả branches
git branch -a
```

---

## Tạo Repository Mới Trên GitHub (Bằng GitHub CLI)

```bash
# Cài đặt GitHub CLI
# Sau đó tạo repo
gh repo create

# Hoặc tạo từ xa trước rồi clone về
gh repo create my-project --public --clone
```
