package interfaces

type Question struct {
	Answer string `json:"answer"`
	Clue   string `json:"clue"`
}
type SwaggerQuestion struct {
	Question []Question `json:"question"`
}

type Responses struct {
	Mark bool `json:"mark"`
}
type SwaggerResponses struct {
	UserId    uint64      `json:"user_id"`
	Responses []Responses `json:"responses"`
}

type User struct {
	Name  string `json:"name" `
	Email string `json:"email"`
	Risk  string `json:"risk"`
}
