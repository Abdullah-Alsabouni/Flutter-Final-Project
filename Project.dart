import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300.0,
              child: Image.asset('images/giris.png'),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xFFC19A6B),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  labelStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xFFC19A6B),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                print('Şifremi Unuttum tıklandı');
              },
              child: Center(
                child: Text(
                  'Şifremi Unuttum',
                  style: TextStyle(color: Color(0xFFC19A6B)),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Giriş Başarılı'),
                      content: Text('Hoş geldiniz, $username!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnaSayfa(),
                              ),
                            );
                          },
                          child: Text('Tamam'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: Color(0xFFB8552B),
              ),
              child: Container(
                height: 35.0,
                child: Center(
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Yeni Hesap Oluştur',
                  style: TextStyle(color: Color(0xFFC19A6B)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  final PageController _pageController = PageController();

  final List<Product> productsPage1 = [
    Product('Ürün Adı 1', '\$19.99', 'images/final1.jpeg'),
    Product('Ürün Adı 2', '\$24.99', 'images/fin2.jpeg'),
    Product('Ürün Adı 3', '\$29.99', 'images/final3.jpeg'),
    Product('Ürün Adı 4', '\$39.99', 'images/final4.jpeg'),
  ];

  final List<Product> productsPage2 = [
    Product('Ürün Adı 5', '\$49.99', 'images/final5.jpeg'),
    Product('Ürün Adı 6', '\$59.99', 'images/final6.jpeg'),
    Product('Ürün Adı 7', '\$69.99', 'images/final7.jpeg'),
    Product('Ürün Adı 8', '\$79.99', 'images/final8.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC19A6B),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ara',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Ara işlemi
                },
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(width: 16.0),
        ],
      ),
      drawer: DrawerMenu(),
      body: PageView(
        controller: _pageController,
        children: [
          ProductPage(productsPage1),
          ProductPage(productsPage2),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Transform.rotate(
                angle: 3.14,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final List<Product> products;

  ProductPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          for (int i = 0; i < products.length; i += 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProductCard(products[i]),
                if (i + 1 < products.length) ProductCard(products[i + 1]),
              ],
            ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ürün resmi
        SizedBox(
          height: 120.0,
          width: 120.0,
          child: Image.asset(
            product.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        // Ürün bilgileri
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              product.price,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        // Sipariş Et butonu
        ElevatedButton(
          onPressed: () {
            // Sipariş Et butonuna tıklama işlemi
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Ürün Sipariş Edildi'),
                  content: Text('Ürün başarıyla sipariş edildi!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Tamam'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFB8552B),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('Sipariş Et'),
        ),
      ],
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFC19A6B),
            ),
            child: Text(
              'Menü',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Siparişlerim'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SiparislerimSayfasi(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Ürünlerim'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UrunlerimSayfasi(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Ürün Talepleri'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UrunTalepleriSayfasi(), // Burada "Ürün Talepleri" sayfasına yönlendirme yapılır.
                ),
              );
            },
          ),
          ListTile(
            title: Text('Yeni Ürün Paylaş'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YeniUrunPaylasSayfasi(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SiparislerimSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siparişlerim'),
        backgroundColor: Color(0xFFC19A6B),
      ),
      body: Center(
        child: Text('Burada görüntülenecek sipariş yok...'),
      ),
    );
  }
}

class UrunlerimSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürünlerim'),
        backgroundColor: Color(0xFFC19A6B),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildProductCard(
              'images/final9.jpeg',
              'ESD Eğik Uçlu Cımbız',
              '174,99 TL',
            ),
            SizedBox(height: 16.0),
            buildProductCard(
              'images/final10.jpeg',
              'UPX 803L Akrobat LED 5X Büyüteç',
              '890,90 TL',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(String imagePath, String productName, String price) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ürün resmi
            SizedBox(
              height: 120.0,
              width: 120.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            // Ürün bilgileri
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    price,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            // Güncelle ve Kaldır butonları
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Güncelle butonuna tıklama işlemi
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Güncelle'),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Kaldır butonuna tıklama işlemi
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Kaldır'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imagePath;

  Product(this.name, this.price, this.imagePath);
}

class YeniUrunPaylasSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Ürün Paylaş'),
        backgroundColor: Color(0xFFC19A6B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ürün Fotoğrafı Ekle kısmı
            Container(
              height: 100.0,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  '+ Ürün Fotoğrafı Ekle',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Girdi alanları
            buildTextInputField('Ürün Adı'),
            buildTextInputField('Marka'),
            buildTextInputField('Sektör'),
            buildTextInputField('Fiyat'),
            buildTextInputField('Ayrıntılar'),

            SizedBox(height: 24.0),

            // Paylaş butonu
            ElevatedButton(
              onPressed: () {
                // Paylaş butonuna tıklama işlemi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ürün başarıyla paylaşıldı!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFB8552B),
                onPrimary: Colors.white,
              ),
              child: Text('Paylaş'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextInputField(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class UrunTalepleriSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Talepleri'),
        backgroundColor: Color(0xFFC19A6B),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  'images/final11.jpeg'), // Profil fotoğrafı buraya eklenecek
            ),
            SizedBox(height: 16.0),
            AliciBilgileriWidget(),
            SizedBox(height: 16.0),
            BasvurulanUrunWidget(),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Satış Onaylandı'),
                      content: Text('Başvurulan ürün için satış onaylandı!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Ek işlemleri buraya ekleyin
                            // Örneğin: Başka bir sayfaya yönlendirme gibi
                          },
                          child: Text('Tamam'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFB8552B),
                onPrimary: Colors.white,
              ),
              child: Text('Onayla'),
            ),
          ],
        ),
      ),
    );
  }
}

class AliciBilgileriWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Alıcı Bilgileri',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text('Adı Soyadı: Abdullah Alsabouni'),
        Text('Mail Adresi: abdullah24sabouni@gmail.com'),
      ],
    );
  }
}

class BasvurulanUrunWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Başvurulan Ürün',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
            'ESD Eğik Uçlu Cımbız'), // Bu değeri başvurulan ürüne göre güncelleyebilirsiniz
      ],
    );
  }
}
