package xray

type Traffic struct {
	IsInbound bool
	IsUser	  bool
	Tag       string
	Up        int64
	Down      int64
}
