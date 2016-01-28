using System.Collections.Generic;
using System.Reflection;

namespace SCI.CIProject.ProjectSaving
{
    public static class Integration
    {
        private static IDictionary<string, string> cipitem = new Dictionary<string, string>();
        public static void SaveInformation(SharePointListItem item)
        {
            var properties = item.GetType().GetProperties();
            foreach (var property in properties)
            {
                if (property.Name.ToUpper() != "INSTANCE")
                {
                    cipitem[property.Name] = property.GetValue(item).ToString();
                }
            }
        }

        public static SharePointListItem GetInformation()
        {
            var item = SharePointListItem.Instance;
            var properties = item.GetType().GetProperties();
            foreach (var property in properties)
            {
                if (property.Name.ToUpper() != "INSTANCE")
                {
                    var value = 0L;
                    long.TryParse(cipitem[property.Name], out value);
                    property.SetValue(item, value);
                }
            }
            return item;
        }
    }
}
