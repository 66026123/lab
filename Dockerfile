# ใช้ Node.js เป็นตัวอย่าง (เปลี่ยนได้ตามที่คุณใช้)
FROM node:20

# ตั้งค่าชื่อรหัสนิสิตเป็น ENV (เช่น 66026123)
ARG STUDENT_ID=66026123

# ตั้งค่าพื้นที่ทำงานใน Container
WORKDIR /app

# คัดลอกโค้ดทั้งหมดไปใน Container
COPY . .

# ติดตั้ง dependencies
RUN npm install

# สร้างแอป (ถ้ามี build step)
RUN npm run build

# เปิดพอร์ต 3000 (หรือพอร์ตที่คุณใช้)
EXPOSE 3000

# คำสั่งเริ่มต้นของ Container
CMD ["npm", "start"]
