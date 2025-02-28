import 'package:url_launcher/url_launcher.dart';

void abrirBiblia() async {
  const appUrl = 'bible://'; // Deep link do app da Bíblia
  const webUrl = 'https://www.bibliaonline.com.br/'; // URL alternativa (site)

  if (await canLaunchUrl(Uri.parse(appUrl))) {
    await launchUrl(Uri.parse(appUrl));
  } else {
    await launchUrl(Uri.parse(webUrl));
  }
}

void abrirMusicasRelaxantes() async {
  const webUrl =
      'https://www.youtube.com/results?search_query=músicas+relaxantes'; // Pesquisa no YouTube

  if (await canLaunchUrl(Uri.parse(webUrl))) {
    await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
  } else {
    throw 'Não foi possível abrir as músicas relaxantes';
  }
}

void abrirAppRespiracao() async {
  const appUrl = 'pranayama://'; // Substitua por um deep link válido, se houver
  const storeUrl =
      'https://play.google.com/store/apps/details?id=pranayama.yoga.breathingexercises';
  const webUrl =
      'https://www.respireprofundo.com.br/'; // Site alternativo sobre respiração

  if (await canLaunchUrl(Uri.parse(appUrl))) {
    await launchUrl(Uri.parse(appUrl)); // Abre o app se estiver instalado
  } else if (await canLaunchUrl(Uri.parse(storeUrl))) {
    await launchUrl(Uri.parse(storeUrl)); // Abre a Play Store para baixar o app
  } else {
    await launchUrl(Uri.parse(webUrl)); // Abre o site sobre respiração
  }
}

void abrirVideosExercicios() async {
  const webUrl =
      'https://www.youtube.com/results?search_query=exercícios+físicos'; // Pesquisa no YouTube

  if (await canLaunchUrl(Uri.parse(webUrl))) {
    await launchUrl(Uri.parse(webUrl));
  } else {
    throw 'Não foi possível abrir os vídeos de exercícios físicos';
  }
}

void abrirVideosAlimentacaoSaudavel() async {
  const webUrl =
      'https://www.youtube.com/results?search_query=alimentação+saudável'; // Pesquisa no YouTube

  if (await canLaunchUrl(Uri.parse(webUrl))) {
    await launchUrl(Uri.parse(webUrl));
  } else {
    throw 'Não foi possível abrir os vídeos sobre alimentação saudável';
  }
}

void abrirTecnicasRelaxamento() async {
  const webUrl =
      'https://www.essentialnutrition.com.br/conteudos/tecnicas-de-relaxamento/'; // Site focado em relaxamento

  if (await canLaunchUrl(Uri.parse(webUrl))) {
    await launchUrl(Uri.parse(webUrl));
  } else {
    throw 'Não foi possível abrir o site de relaxamento';
  }
}

void abrirDiarioOnline() async {
  const webUrl = 'https://penzu.com/'; // Site para escrever um diário online

  if (await canLaunchUrl(Uri.parse(webUrl))) {
    await launchUrl(Uri.parse(webUrl));
  } else {
    throw 'Não foi possível abrir o diário online';
  }
}
