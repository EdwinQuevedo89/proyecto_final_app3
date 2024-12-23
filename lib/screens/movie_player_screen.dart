import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'movie_catalog_screen.dart';

class MoviePlayerScreen extends StatefulWidget {
  final Movie movie; // Película recibida

  const MoviePlayerScreen({super.key, required this.movie});

  @override
  // ignore: library_private_types_in_public_api
  _MoviePlayerScreenState createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late YoutubePlayerController _controller;

  // Inicializa el controlador con el ID del video de YouTube
  @override
  void initState() {
    super.initState();
    // Puedes crear un mapa para las películas y sus correspondientes IDs de YouTube
    String videoId = _getVideoId(widget.movie.title);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  // Función para obtener el ID del video de YouTube según el título de la película
  String _getVideoId(String title) {
    switch (title) {
      case 'Inception':
        return 'YoHD9XEInc0';
      case 'The Dark Knight':
        return 'EXeTwQWrcwY';
      case 'The Big Short':
        return 'vgqG3ITMv1Q';
      case 'Interstellar':
        return 'LYS2O1nl9iM';
      case 'Tenet':
        return 'CdRL6o8z-2A';
      case 'Dune':
        return 'TTgk_iT8Uts';
      default:
        return ''; // Si no hay coincidencia, no cargar ningún video
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reproductor de YouTube
              YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.red,
              ),
              const SizedBox(height: 20),
              // Título de la película
              Text(
                widget.movie.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Descripción de la película
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.movie.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botón para regresar al catálogo
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Volver a la pantalla del catálogo
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver al Catálogo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
