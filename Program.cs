var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Endpoints simples
app.MapGet("/", () => "🏠 Bem-vindo à Minimal API com .NET 9!");

app.MapGet("/hello", () => "👋 Olá, mundo!");

app.MapGet("/saudacao/{nome}", (string nome) =>
{
    return $"👋 Olá, {nome}! Seja bem-vindo(a).";
});

app.MapPost("/mensagem", (Mensagem msg) =>
{
    return Results.Ok($"📩 Mensagem recebida: {msg.Texto}");
});

app.Run();

record Mensagem(string Texto);
