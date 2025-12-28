using System.ComponentModel.DataAnnotations;

namespace CmsShoppingCart.Models
{
    public class Page
    {
        public int Id { get; set; }
        [Required , MinLength(2, ErrorMessage ="minimum 2 caractères")]
        public string Title { get; set; }
        public string? Slug { get; set; }

        [Required, MinLength(4, ErrorMessage = "minimum 4 caractères")]
        public string Content { get; set; }
        public int Sorting { get; set; }
    }
}
