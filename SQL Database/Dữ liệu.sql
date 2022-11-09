--Dữ liệu Project PRJ301
use WebProject2022

go

insert into [Category]
values (1,'BLUETOOTH HEADPHONE',N'images/cat1.png');
insert into [Category]
values (2,'WIRED HEADPHONES',N'images/cat2.png');
insert into [Category]
values (3,'OVER-EAR HEADPHONES',N'images/cat3.png');
insert into [Category]
values (4,'BLUETOOTH SPEAKER',N'images/cat4.png');
insert into [Category]
values (5,'MP3 PLAYER',N'images/cat5.png');

select * from Category

go
--images
--Hãng theo category id:
--1. hãng beats
--2. hãng sony
--3. hãng remax
--4. hãng JBL
--5. hãng SamSung
go
--1. BLUETOOTH HEADPHONE
--2. WIRED HEADPHONES
--3. OVER-EAR HEADPHONES
--4. BLUETOOTH SPEAKER
--5. MP3 PLAYER
go
--1. Tai nghe không dây:
-- 5 hãng
--hãng beats
insert into [Product]
values (1,'Beats Fit Pro',150,100,0,'If you are a sports lover and want to experience professional sound, you will definitely not be able to ignore the new True Wireless Beats Fit Pro headset model of the Beats / Apple brand. The product is the successor of Beats Studio Buds, integrating ANC active noise cancellation technology, Bluetooth connectivity, fast charging support and Audio Sharing audio sharing feature,..',1,1,N'images/beats1.png')
--hãng sony
insert into [Product]
values (1,'Sony WF-C500',60,100,0,'If you are a genuine Audiophile believer, then surely you will no longer feel unfamiliar with the famous Sony brand. They not only produce products in the high-end segment, but also launch many devices in the mid-range and low-cost segments. Recently, Sony has launched the WF-C500 true wireless Bluetooth headset model - an upgraded version of the design and features of the WF-1000XM4; guaranteed to satisfy all audio enthusiasts worldwide.',1,2,N'images/sony1.png')
--hãng remax
insert into [Product]
values (1,'Remax TWS-18',30,100,0,'Visually, Remax TWS-18 possesses a design similar to Apple high-end Airpods model with high finishing and soft curves that make it comfortable to use. Using the familiar earbuds structure, this True Wireless headset allows to be fixed to any ear mold firmly, not easy to slip out. Not to mention, this design also has an extremely effective noise filter function, ensuring sound quality when used in noisy environments.',1,3,N'images/remax1.png')
--hãng JBL
insert into [Product]
values (1,'JBL Tune 115TWS',20,100,0,'JBL Tune 115TWS True Wireless headphones have a compact design, each earpiece is a driver with a diameter of 5.8mm. Soft in-ear rubber cushions combine with ergonomic design to be able to stick firmly to the ear but still create a comfortable and pleasant feeling when worn for the user. With its small size and 73g weight, Tune 115TWS will be extremely convenient for you to carry with you, use it anytime and anywhere.',1,4,N'images/JBL1.png')
--hãng samsung
insert into [Product]
values (1,'Samsung Galaxy Buds2 Pro',200,100,0,'Immerse yourself in the real world in every tone with the intelligent 360 feature, the listening experience becomes surprisingly real. 360 Audio algorithms with Direct multichannel (5.1ch / 7.1ch / Dolby Atmos) and enhanced Dolby Head Tracking synchronize every movement — creating an immersive listening experience. 360 Audio can even determine the direction of the sound as you move the head region, providing a spatially standard experience.',1,5,N'images/samsung1.png')

go
--2. Tai nghe có dây:
-- 5 hãng
--hãng beats 
insert into [Product]
values (2,'Beats 3 with Lightning',50,100,0,'The urBeats 3 with lightning headset is a new generation In Ear headset from Apple. The lightning jack version is designed exclusively for iPhone and iPad models. urBeats 3 features a youthful, dynamic, colorful design that is suitable for today youth.',1,1,N'images/beats2.png')
--hãng sony
insert into [Product]
values (2,'Sony MDR-XB55AP',30,100,0,'For students, when it comes to headphones, the choice is certainly directed to cheap audio products with a price range of less than 1 million dong. And it is certain that when it comes to this price range, you can not ignore the Sony MDR-XB55AP headset, it can be said that this is one of the top choices in the cheap range from the great Sony audio family...',1,2,N'images/sony2.png')
--hãng remax
insert into [Product]
values (2,'Remax RM-533',10,100,0,'The Remax RM-533 wired headset has a modern and trendy design similar to the AirPods Pro version with a 3.5mm foot wire. The product is well-finished with soft, delicate curves. Remax RM-533 has an elegant, compact white tone with a weight of only 12.5g, giving the feeling of wearing it like not wearing it.',1,3,N'images/remax2.png')
--hãng JBL
insert into [Product]
values (2,'JBL Focus 300',20,100,0,'JBL Focus 300 in-ear headphones are stylish, compact and easy to carry anywhere. The small round cable helps to limit tangles, making the headset more personal. The 14.2mm drivers reproduce sound from 20Hz to 20kHz and the Flexsoft silicone keeps you comfortable.',1,4,N'images/JBL2.png')
--hãng samsung
insert into [Product]
values (2,'Samsung IA500',10,100,0,'The Samsung IA500 EP headset cord has a length of 1.25 m, which is very convenient to use, you can put the phone with the headset cord plugged into your pocket or backpack and still use it, no need to hold it in your hand to use. When wearing the headset for a long time, the user will not feel pain or heaviness in the ear due to its weight of only 14.76 g. At the same time, it is also equipped with extremely soft rubber cushions, there are 3 sizes of cushions to suit all ear shapes.',1,5,N'images/samsung2.png')
go

--3. Tai nghe trùm đầu:
-- 5 hãng
--hãng beats 
insert into [Product]
values (3,'Beats Studio 3',220,100,0,'Beats is a name that is no longer strange to any audio player in Vietnam from amateur to professional, especially with young people, the Beats Audio sound brand has been really popular. Beats products are always very popular with bassheads with very characteristic bass, especially Beats headphones are always the first choice of famous DJs at major music events around the world.',1,1,N'images/beats3.png')
--hãng sony
insert into [Product]
values (3,'Sony WH-1000XM4',180,100,0,'Recently, Sony has just announced the 4th generation of high-end noise-cancelling headphones: WH1000XM4. The Sony WH-1000XM4 has the same design as its elder brother, and is also equipped with the QN1 noise-cancelling processor, which makes the Sony WH-1000XM3 one of the best wireless headphones in the segment. active noise.',1,2,N'images/sony3.png')
--hãng remax
insert into [Product]
values (3,'WK M9 game headset',30,100,0,'WK M9 Gaming Headset has a modern, youthful design with a very thorough finish, extremely solid structure. According to the announcement from the manufacturer, the M9 has a size of 250x210x110mm and a fairly light weight of 396g, making it easy to fit on the listener ear for a long time without causing headaches. Although the overall is a bit bulky, you can still easily carry them anywhere.',1,3,N'images/remax3.png')
--hãng JBL
insert into [Product]
values (3,'JBL Tune 510BT headset',50,100,0,'Immerse yourself in natural and vibrant music when using JBL Tune 51BT headphones to play your favorite tracks every day. This is an improved version from the elder T5000BT, using 32mm drivers to reproduce powerful bass, along with clear highs and mids; very suitable for playing soft or lyrical music genres. On the other hand, JBL Tune 510BT also supports you to connect to Siri or Google without using mobile devices.',1,4,N'images/JBL3.png')
--hãng samsung
insert into [Product]
values (3,'Bluetooth AKG Y500',25,100,0,'You are a gamer, you always want to enjoy your own music space without being disturbed by outside noises. AKG Y500 Bluetooth headset is a latest generation bluetooth headset that is manufactured by Samsung to meet the best needs of people who stop using it.',1,5,N'images/samsung3.png')

go 

--4. Loa bluetooth:
-- 5 hãng
--hãng beats 
insert into [Product]
values (4,'BEATS PILL PLUS',100,100,0'Beats Pill+ speaker with two tweeters and woofers facing the listener, 2-way stereo crossover system actively optimizes sound quality for a more expansive music space. The design of the speaker is quite monotonous with the Beats logo in the middle, the power switch and battery status LED on the left and two volume up and down buttons on the right.',1,1,N'images/beats4.png')
--hãng sony
insert into [Product]
values (4,'Sony SRS-XE300',240,100,0,'Enjoy an exciting music party with the latest SRS-XE300 wireless speaker from the Sony brand. Not only possessing a modern design style, intuitive wireless connectivity, and great battery life, but also providing a quality audio experience. That is the reason why Sony SRS-XE300 is trusted and chosen by many users.',1,2,N'images/sony4.png')
--hãng remax
insert into [Product]
values (4,'Remax RB-M7',240,100,0,'Remax has shown its sophistication in the design of the Remax RB-M7 Bluetooth Speaker, a compact product with superior sound. Really compact and lightweight appearance combined with a strap that is very convenient to carry on the go, it can be said that this is a great choice for you.',1,3,N'images/remax4.png')
--hãng JBL
insert into [Product]
values (4,'JBL Flip 5',70,100,0,'Blow up your outdoor music party with JBL most popular JBL Flip 5 Speaker, this is an ultra-portable bluetooth speaker with a compact design that combines JBL top-notch sound and many Today most advanced features such as Bluetooth 4.2, 12-hour battery, IPX7 water resistance, talk microphone... bring the best audio experience anywhere, from indoors to outdoors.',1,4,N'images/JBL4.png')
--hãng samsung
insert into [Product]
values (4,'Samsung HW-T420',50,100,0,'The Samsung HW-T420 soundbar has a modern beauty with a square monolithic design at the edges. The strong black color makes the speaker stand out and creates a highlight for the surrounding interior space. The size of the parts is compact so you can arrange it easily in any room.',1,5,N'images/samsung4.png')
go 

--5. Máy nghe nhạc:
-- 5 hãng
--hãng beats 
insert into [Product]
values (5,'Beats hi-end',300,100,0,'The music player model is the first model in Beats new mid-range lineup. This line of high-end music players is introduced as a bridge for new audio players to Hi-Res high quality music and brings with them the full sound quality and outstanding features of high-end music players that will does not disappoint consumers.',1,1,N'images/beats5.png')
--hãng sony
insert into [Product]
values (5,'Sony NW-A55',260,100,0,'Perhaps not all audiophiles have high conditions, so cheap audio products are very popular, including music players that are an indispensable part of helping customers. Your portable audio system is perfect. In the selection of cheap music players, we will have NW-Ax5 warriors from Sony like the A35 or A45 and recently the A55 with a lot of valuable improvements but still keeping a good price.',1,2,N'images/sony5.png')
--hãng remax
insert into [Product]
values (5,'HIFI Remax RP2',60,100,0,'HIFI BLUETOOTH REMAX RP PLAYER on laptop, mobile phone is not enough to satisfy your passion for music, sometimes causing inconveniences that interrupt the fun. Then the following HIFI Bluetooth Remax RP2 music player will be an indispensable companion to bring you and music closer together anytime, anywhere.',1,3,N'images/remax5.png')
--hãng JBL
insert into [Product]
values (5,'JBL M20',70,100,0,'After many unofficial sources, JBL has officially introduced the M20 Series high-end Walkman music player. With the first model, the JBL M20 music player, which possesses an extremely powerful configuration and stylish, stylish and classy design, will give users a very new and enjoyable experience.',1,4,N'images/JBL5.png')
--hãng samsung
insert into [Product]
values (5,' Samsung YP-R2',120,100,0,'Like its previous generation music players, Samsung also equips the two new models with SoundAlive technology that allows music listeners to adjust the sound to their liking with a range of EQ modes. In addition to music playback, R2 is also equipped with the ability to enjoy multimedia video content with integrated 5.1 surround sound system and WQVGA resolution screen. Both come with slim design, the thickness is only about 8.6 mm.',1,5,N'images/samsung5.png')

select * from Product

--insert into Role
insert into [Role]
values (1,'Admin')
go
insert into [Role]
values (2,'User')

--insert into [User]
insert into [User]
values ('saka289','saka2892002',N'Lê Nam','saka289@icloud.com','0961677176',N'Hà Nội',1)
insert into [User]
values ('nam289','2892002',N'David','david@icloud.com','0123456789',N'Hà Nội',2)

--insert into [Brands]
insert into [Brands]
values (1,'Beats')
insert into [Brands]
values (2,'Sony')
insert into [Brands]
values (3,'Remax')
insert into [Brands]
values (4,'JBL')
insert into [Brands]
values (5,'Samsung')