package db

type User struct {
	ID    uint64 `json:"id" xorm:"'id' notnull pk autoincr"`
	Name  string `json:"name" xorm:"'name' VARCHAR(100) notnull"`
	Email string `json:"email" xorm:"'email' VARCHAR(100) notnull"`
	Risk  string `json:"risk" xorm:"'risk' VARCHAR(100) notnull"`
}
