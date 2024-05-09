import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thunder Gym',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(), // Add this line
        '/workouts': (context) => WorkoutsPage(),
        '/plans': (context) => PlansPage(),
        '/trainers': (context) => TrainersPage(),
        '/settings': (context) => SettingsPage(),
        '/profile': (context) => ProfilePage(),
        '/support': (context) => SupportPage(),
        '/about_us': (context) => AboutUsPage(),
        '/founder_info': (context) => FounderInfoPage(),
        '/faq': (context) => FAQPage(),
      },
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thunder Gym'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2A3C53), Color(0xFF0F1923)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircleIcon(
                      icon: Icons.fitness_center,
                      color: Colors.orange,
                      onTap: () {
                        Navigator.pushNamed(context, '/workouts');
                      },
                    ),
                    _buildCircleIcon(
                      icon: Icons.calendar_today,
                      color: Colors.green,
                      onTap: () {
                        Navigator.pushNamed(context, '/plans');
                      },
                    ),
                    _buildCircleIcon(
                      icon: Icons.person,
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pushNamed(context, '/trainers');
                      },
                    ),
                    _buildCircleIcon(
                      icon: Icons.info,
                      color: Colors.purple,
                      onTap: () {
                        Navigator.pushNamed(context, '/about_us');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildCard(
                  icon: Icons.fitness_center,
                  label: 'Workouts',
                  description: 'Browse workout routines and exercises.',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.pushNamed(context, '/workouts');
                  },
                ),
                SizedBox(height: 20),
                _buildCard(
                  icon: Icons.calendar_today,
                  label: 'Plans',
                  description: 'Explore membership plans and offers.',
                  color: Colors.green,
                  onTap: () {
                    Navigator.pushNamed(context, '/plans');
                  },
                ),
                SizedBox(height: 20),
                _buildCard(
                  icon: Icons.person,
                  label: 'Trainers',
                  description: 'Meet our professional trainers.',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.pushNamed(context, '/trainers');
                  },
                ),
                SizedBox(height: 20),
                _buildCard(
                  icon: Icons.info,
                  label: 'About Us',
                  description: 'Meet our founders!',
                  color: Colors.purple,
                  onTap: () {
                    Navigator.pushNamed(context, '/about_us');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ),
              ),
              child: Image.network(
                'https://i.ibb.co/x8cHvvF/image.png',
                width: 100,
                height: 100,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('Support'),
              leading: Icon(Icons.support),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/support');
              },
            ),
            ListTile(
              title: Text('FAQ'),
              leading: Icon(Icons.question_answer),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/faq');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}







class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          FaqCard(
            question: 'What are the benefits of regular exercise?',
            answer:
                'Regular exercise has numerous benefits, including improved cardiovascular health, increased muscle strength and flexibility, weight management, and enhanced mood and mental well-being.',
          ),
          SizedBox(height: 20),
          FaqCard(
            question: 'How many times a week should I work out?',
            answer:
                'It is recommended to engage in at least 150 minutes of moderate-intensity exercise or 75 minutes of vigorous-intensity exercise per week, spread across several days for optimal health benefits.',
          ),
          SizedBox(height: 20),
          FaqCard(
            question: 'Do I need to lift weights to get in shape?',
            answer:
                'While weightlifting can be beneficial for building muscle and strength, it is not the only way to get in shape. Activities like cardio exercises, yoga, and bodyweight exercises can also contribute to overall fitness.',
          ),
          SizedBox(height: 20),
          FaqCard(
            question: 'What should I eat before and after a workout?',
            answer:
                'Before a workout, focus on consuming carbohydrates for energy and a small amount of protein. After a workout, aim for a balanced meal with protein and carbohydrates to help with recovery and muscle repair.',
          ),
        ],
      ),
    );
  }
}

class FaqCard extends StatelessWidget {
  final String question;
  final String answer;

  const FaqCard({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              answer,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}





class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://i.ibb.co/x8cHvvF/image.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Thunder Gym',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.ibb.co/x8cHvvF/image.png', // Replace with your image link
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/founder_info',
                        arguments: FounderInfo(
                            'Ibrahem Elgamal',
                            'Founder and Fitness Expert',
                            'https://scontent-hbe1-2.xx.fbcdn.net/v/t39.30808-6/424681361_3167643336713576_4558248785748729147_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9KZr-KRCShwAb6hNGfc&_nc_ht=scontent-hbe1-2.xx&oh=00_AfAe4ao6M3eI09J-8SjR8ztlUnqYz2ksTq1TRbE9KRDkWg&oe=662DA8F8'));
                  },
                  child: FounderCard(
                    name: 'Ibrahem Elgamal',
                    position: 'Founder and Fitness Expert',
                    imageUrl:
                        'https://scontent-hbe1-2.xx.fbcdn.net/v/t39.30808-6/424681361_3167643336713576_4558248785748729147_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9KZr-KRCShwAb6hNGfc&_nc_ht=scontent-hbe1-2.xx&oh=00_AfAe4ao6M3eI09J-8SjR8ztlUnqYz2ksTq1TRbE9KRDkWg&oe=662DA8F8',
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/founder_info',
                        arguments: FounderInfo(
                            'Ahmed Kamal',
                            'Co-founder and Nutritionist',
                            'https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-6/319212653_901192654625496_8847587110721622010_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=YezUgWtZ8wAAb6mlzmD&_nc_ht=scontent.fcai21-4.fna&oh=00_AfBVhGKfUXbKzGTXpy_kR6Gu5xzNjFOgmY8LpoR1aKojYA&oe=662DA94A'));
                  },
                  child: FounderCard(
                    name: 'Ahmed Kamal',
                    position: 'Co-founder and Nutritionist',
                    imageUrl:
                        'https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-6/319212653_901192654625496_8847587110721622010_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=YezUgWtZ8wAAb6mlzmD&_nc_ht=scontent.fcai21-4.fna&oh=00_AfBVhGKfUXbKzGTXpy_kR6Gu5xzNjFOgmY8LpoR1aKojYA&oe=662DA94A',
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/founder_info',
                        arguments: FounderInfo(
                            'Ahmed Abo Shady',
                            'Co-founder and Yoga Instructor',
                            'https://scontent-hbe1-2.xx.fbcdn.net/v/t1.6435-1/168003089_934434757305299_2741582340587776082_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=arEvX6BCch8Ab666iIt&_nc_ht=scontent-hbe1-2.xx&oh=00_AfBCUUSGU1PHhooROWsh71zrEopGq4W4-A9zP0K2_wdjVA&oe=664F4AAE'));
                  },
                  child: FounderCard(
                    name: 'Ahmed Abo Shady',
                    position: 'Co-founder and Yoga Instructor',
                    imageUrl:
                        'https://scontent-hbe1-2.xx.fbcdn.net/v/t1.6435-1/168003089_934434757305299_2741582340587776082_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=arEvX6BCch8Ab666iIt&_nc_ht=scontent-hbe1-2.xx&oh=00_AfBCUUSGU1PHhooROWsh71zrEopGq4W4-A9zP0K2_wdjVA&oe=664F4AAE',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FounderInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FounderInfo founderInfo =
        ModalRoute.of(context)!.settings.arguments as FounderInfo;

    return Scaffold(
      appBar: AppBar(
        title: Text(founderInfo.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: founderInfo.imageUrl,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(founderInfo.imageUrl),
              ),
            ),
            SizedBox(height: 20),
            Text(
              founderInfo.position,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod diam vel justo elementum, nec malesuada mi consequat.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FounderInfo {
  final String name;
  final String position;
  final String imageUrl;

  FounderInfo(this.name, this.position, this.imageUrl);
}

class FounderCard extends StatelessWidget {
  final String name;
  final String position;
  final String imageUrl;

  const FounderCard({
    Key? key,
    required this.name,
    required this.position,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      position,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod diam vel justo elementum, nec malesuada mi consequat.',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://i.ibb.co/x8cHvvF/image.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class IconCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;

  const IconCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}



class Trainer {
  final String name;
  final String specialization;
  final String imageUrl;

  Trainer({
    required this.name,
    required this.specialization,
    required this.imageUrl,
  });
}

List<Trainer> trainers = [
  Trainer(
    name: 'John Doe',
    specialization: 'Fitness Trainer',
    imageUrl:
        'https://th.bing.com/th/id/OIP.9usApmq8JzCDJVP4pX82lgHaE7?rs=1&pid=ImgDetMain',
  ),
  Trainer(
    name: 'Jane Smith',
    specialization: 'Yoga Instructor',
    imageUrl:
        'https://www.shutterstock.com/image-photo/handsome-trainer-using-tablet-weights-600nw-330619865.jpg',
  ),
];

class TrainersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainers'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://i.ibb.co/x8cHvvF/image.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          final trainer = trainers[index];
          return TrainerCard(trainer: trainer);
        },
      ),
    );
  }
}

class TrainerCard extends StatelessWidget {
  final Trainer trainer;

  const TrainerCard({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            trainer.imageUrl,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trainer.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  trainer.specialization,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Workout {
  final String title;
  final String description;
  final String imageUrl;

  Workout({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

List<Workout> workouts = [
  Workout(
    title: 'Upper Body Workout',
    description:
        'Strengthen your upper body muscles with this intense workout.',
    imageUrl:
        'https://th.bing.com/th/id/OIP.u-_SJQEMHVpK8TPVlOaGdwHaD4?rs=1&pid=ImgDetMain',
  ),
  Workout(
    title: 'Leg Day Challenge',
    description:
        'Build strong and powerful legs with this challenging leg day routine.',
    imageUrl:
        'https://th.bing.com/th/id/OIP.KiyS9N7Iq7OBnL67CEasGwHaEG?rs=1&pid=ImgDetMain',
  ),
];

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://i.ibb.co/x8cHvvF/image.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return WorkoutCard(workout: workout);
        },
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            workout.imageUrl,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  workout.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Plan {
  final String title;
  final String description;
  final String imageUrl;

  Plan({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

List<Plan> plans = [
  Plan(
    title: 'Premium Membership',
    description: 'Access to all facilities and personal training sessions.',
    imageUrl:
        'https://th.bing.com/th/id/OIP.udXQp0kDI5c3r-qVlOCHCwHaHa?rs=1&pid=ImgDetMain',
  ),
  Plan(
    title: 'Standard Membership',
    description: 'Basic access to gym facilities and group training sessions.',
    imageUrl:
        'https://th.bing.com/th/id/R.d3bc6f794eb0cb902112e419a14615d1?rik=XhxQ9LVd3G6sAQ&pid=ImgRaw&r=0',
  ),
];

class PlansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plans'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://i.ibb.co/x8cHvvF/image.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return PlanCard(plan: plan);
        },
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final Plan plan;

  const PlanCard({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            plan.imageUrl,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  plan.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text('Dark Theme'),
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;


                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Other Settings'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController =
      TextEditingController(text: 'John Doe');
  TextEditingController _emailController =
      TextEditingController(text: 'johndoe@example.com');
  TextEditingController _heightController =
      TextEditingController(text: '180 cm');
  TextEditingController _weightController =
      TextEditingController(text: '80 kg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(
                'https://i.ibb.co/x8cHvvF/image.png',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height',
                prefixIcon: Icon(Icons.height),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight',
                prefixIcon: Icon(Icons.fitness_center),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                String newName = _nameController.text;
                String newEmail = _emailController.text;
                String newHeight = _heightController.text;
                String newWeight = _weightController.text;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile Updated')),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://i.ibb.co/x8cHvvF/image.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Contact Us'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Waiting List'),
          ),
        ],
      ),
    );
  }
}
