echo tidy up
go mod tidy
pause

echo test
go test ./...
pause

echo push latest changes
git commit -m "wrr: release v0.1.0"
git tag v0.1.0
git push origin v0.1.0
pause

echo go list

set GOPROXY=proxy.golang.org 
go list -m github.com/willie68/WeightedRoundRobinSimple@v0.1.0

https://pkg.go.dev/github.com/willie68/WeightedRoundRobinSimple#section-readme