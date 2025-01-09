-- Active: 1727920009057@@127.0.0.1@5432@ph@public
SELECT * FROM students;
-- টাস্ক 1: প্রতিটি কোর্সে কতজন শিক্ষার্থী আছে তা বের করুন।
SELECT course, COUNT(*) FROM students
    GROUP BY course;

-- টাস্ক 2: সেই কোর্সগুলোর তালিকা বের করুন যেখানে শিক্ষার্থীর সংখ্যা ২-এর বেশি।
SELECT course, COUNT(*) FROM students
    GROUP BY course
    HAVING COUNT(*) > 2;

-- টাস্ক 3: প্রতিটি দেশ থেকে কতজন শিক্ষার্থী আছে তা বের করুন।
SELECT country, COUNT(*) FROM students
GROUP BY country;

-- টাস্ক 4: প্রতিটি ব্লাড গ্রুপের শিক্ষার্থীদের গড় বয়স বের করুন।
SELECT blood_group, avg(age) FROM students
GROUP BY blood_group;

-- টাস্ক 5: ব্লাড গ্রুপ অনুযায়ী গড় বয়স বের করুন, এবং শুধুমাত্র যেসব ব্লাড গ্রুপের গড় বয়স ২০-এর বেশি, সেগুলো দেখান।
SELECT blood_group, avg(age) AS avg_age FROM students
GROUP BY blood_group
HAVING avg(age) > 20;

-- টাস্ক 6: প্রতিটি কোর্সে শিক্ষার্থীদের সংখ্যা বের করুন এবং যে কোর্সগুলোতে ২০ বছরের কম বয়সী শিক্ষার্থীরা আছে তাদের ফিল্টার করুন।

SELECT course, COUNT(*) FROM students 
WHERE age < 20
GROUP BY course;

-- টাস্ক 7: প্রতিটি জন্ম বছর অনুযায়ী শিক্ষার্থীদের সংখ্যা বের করুন এবং শুধু সেই বছরগুলো দেখান যেখানে শিক্ষার্থীর সংখ্যা ২-এর বেশি।
SELECT EXTRACT(YEAR FROM dob) AS birth_year , COUNT(*) FROM students 
GROUP BY birth_year 
HAVING COUNT(*) > 2;
