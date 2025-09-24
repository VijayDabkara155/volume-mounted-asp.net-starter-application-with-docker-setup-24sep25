var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddControllers();

var app = builder.Build();

// Map API controllers
app.MapControllers();

// Add test endpoint
app.MapGet("/hello", () => "Hello vijay changes reflected 🚀");

app.Run();

