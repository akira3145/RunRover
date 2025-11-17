namespace Rover.Dtos
{
    public record RegisterDto(string Email, string Password, string Name, string PhoneNo, string Address);
    public record LoginDto(string Email, string Password);
    public record GoogleTokenDto(string IdToken);
    public record ForgotPasswordDto(string Email);
}
