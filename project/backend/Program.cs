var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddControllers();

var app = builder.Build();

// Map API controllers
app.MapControllers();

// Add hello world test endpointi
app.MapGet("/hello", () => "Hello vijay changes reflected  🚀");

app.Urls.Add("http://0.0.0.0:8080");
app.Run();

