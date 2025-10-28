namespace Rover.Dtos
{
    public record RegisterDto(string Email, string Password, string Name, string PhoneNo, string Address);
    public record LoginDto(string Email, string Password);
    public record ForgotPasswordDto(string Email);
}
