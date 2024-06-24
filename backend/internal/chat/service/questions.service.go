package chat

import (
	"chat/internal/interfaces"
	"fmt"
)

func MakeRisk(data []interfaces.Responses) (string, error) {
	var score int
	if len(data) < 20 {
		return "", fmt.Errorf("Invalid Responses :(")
	}
	for _, response := range data {
		if response.Mark {
			score++
		}
	}

	switch {
	case score >= 0 && score <= 2:
		return "Low risk", nil
	case score >= 3 && score <= 7:
		return "Moderate risk", nil
	case score >= 8 && score <= 20:
		return "High risk", nil
	default:
		return "", fmt.Errorf("Invalid Score")
	}
}

func GetQuestions() []interfaces.Question {
	return []interfaces.Question{
		{
			Answer: "Se você aponta para algo do outro lado da sala, seu filho olha para isso?",
			Clue:   "POR EXEMPLO, se você aponta para um brinquedo ou um animal, seu filho olha para o brinquedo ou animal?",
		},
		{
			Answer: "Você já se perguntou se seu filho pode ser surdo?",
			Clue:   "POR EXEMPLO, você tem preocupações de que seu filho não responde a sons ou vozes?",
		},
		{
			Answer: "Seu filho brinca de faz de conta ou de imaginação?",
			Clue:   "POR EXEMPLO, fingir beber de uma xícara vazia, fingir falar ao telefone ou fingir alimentar uma boneca ou bicho de pelúcia?",
		},
		{
			Answer: "Seu filho gosta de escalar coisas?",
			Clue:   "POR EXEMPLO, móveis, equipamentos de playground ou escadas?",
		},
		{
			Answer: "Seu filho faz movimentos incomuns com os dedos perto dos olhos?",
			Clue:   "POR EXEMPLO, seu filho acena os dedos perto do rosto ou olha de perto para objetos de uma maneira incomum?",
		},
		{
			Answer: "Seu filho aponta com um dedo para pedir algo ou pedir ajuda?",
			Clue:   "POR EXEMPLO, apontando para um lanche ou brinquedo que está fora de alcance?",
		},
		{
			Answer: "Seu filho aponta com um dedo para lhe mostrar algo interessante?",
			Clue:   "POR EXEMPLO, apontando para um avião no céu ou um grande caminhão na estrada?",
		},
		{
			Answer: "Seu filho se interessa por outras crianças?",
			Clue:   "POR EXEMPLO, seu filho observa outras crianças, sorri para elas ou vai até elas?",
		},
		{
			Answer: "Seu filho mostra coisas para você trazendo-as para você ou segurando-as para você ver – não para pedir ajuda, mas apenas para compartilhar?",
			Clue:   "POR EXEMPLO, mostrando-lhe uma flor, um bicho de pelúcia ou um caminhão de brinquedo?",
		},
		{
			Answer: "Seu filho responde quando você chama o nome dele?",
			Clue:   "POR EXEMPLO, ele ou ela olha para cima, fala ou balbucia, ou para o que está fazendo quando você chama o nome dele ou dela?",
		},
		{
			Answer: "Quando você sorri para seu filho, ele ou ela sorri de volta para você?",
			Clue:   "POR EXEMPLO, seu filho mostra uma resposta positiva ou reconhecimento ao seu sorriso?",
		},
		{
			Answer: "Seu filho fica chateado com ruídos do dia-a-dia?",
			Clue:   "POR EXEMPLO, seu filho grita ou chora com ruídos como aspirador de pó ou música alta?",
		},
		{
			Answer: "Seu filho anda?",
			Clue:   "POR EXEMPLO, seu filho é capaz de andar sozinho ou com assistência mínima?",
		},
		{
			Answer: "Seu filho olha nos seus olhos quando você está falando com ele, brincando com ele ou vestindo ele?",
			Clue:   "POR EXEMPLO, seu filho faz contato visual durante interações ou atividades?",
		},
		{
			Answer: "Seu filho tenta imitar o que você faz?",
			Clue:   "POR EXEMPLO, acenar tchau, bater palmas ou fazer um barulho engraçado quando você faz?",
		},
		{
			Answer: "Se você vira a cabeça para olhar para algo, seu filho olha ao redor para ver o que você está olhando?",
			Clue:   "POR EXEMPLO, seu filho segue seu olhar para entender o que você está olhando?",
		},
		{
			Answer: "Seu filho tenta fazer com que você o assista?",
			Clue:   "POR EXEMPLO, seu filho olha para você em busca de elogios, ou diz 'olha' ou 'veja-me'?",
		},
		{
			Answer: "Seu filho entende quando você diz para ele fazer algo?",
			Clue:   "POR EXEMPLO, se você não aponta, seu filho entende 'coloque o livro na cadeira' ou 'traga-me o cobertor'?",
		},
		{
			Answer: "Se algo novo acontece, seu filho olha para seu rosto para ver como você se sente sobre isso?",
			Clue:   "POR EXEMPLO, se ele ou ela ouve um ruído estranho ou engraçado, ou vê um novo brinquedo, ele ou ela olha para seu rosto?",
		},
		{
			Answer: "Seu filho gosta de atividades de movimento?",
			Clue:   "POR EXEMPLO, ser balançado ou pulado no seu joelho?",
		},
	}
}
