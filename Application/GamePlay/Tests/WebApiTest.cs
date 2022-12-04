using GamePlay.Data;
using GamePlay.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using Microsoft.AspNetCore.Mvc.Routing;
using NuGet.Protocol;
using Newtonsoft.Json;
using System.Web;

namespace Tests
{
    public class WebApiTest : IClassFixture<WebApplicationFactory<Program>>
    {
        private HttpClient _client;
        public WebApiTest(WebApplicationFactory<Program> factory)
        {
            _client = factory.CreateClient();
        }

        [Fact]
        public async Task Test_HomeController_Index()
        {
            var response = await _client.GetAsync("/Home/Index");

            response.EnsureSuccessStatusCode();

            var content = await response.Content.ReadAsStringAsync();

            Assert.Contains("Witcher 3", content);
        }


        [Fact]
        public async Task Test_HomeController_Index_Filters()
        {
            var response = await _client.GetAsync("Home/Index?Genres%5B0%5D.Item.Idgenre=2&Genres%5B0%5D.Item.Name=Action&Genres%5B1%5D.Item.Idgenre=3&Genres%5B1%5D.Item.Name=Adventure&Genres%5B2%5D.Item.Idgenre=13&Genres%5B2%5D.Item.Name=Battle+Royal&Genres%5B3%5D.Item.Idgenre=8&Genres%5B3%5D.Item.Name=Free-2-Play&Genres%5B4%5D.Item.Idgenre=5&Genres%5B4%5D.Item.Name=Hack-%26-Slash&Genres%5B5%5D.Item.Idgenre=16&Genres%5B5%5D.Item.Name=Indie&Genres%5B6%5D.Item.Idgenre=17&Genres%5B6%5D.Item.Name=Platform&Genres%5B7%5D.Selected=true&Genres%5B7%5D.Item.Idgenre=1&Genres%5B7%5D.Item.Name=RPG&Genres%5B8%5D.Item.Idgenre=10&Genres%5B8%5D.Item.Name=Sandbox&Genres%5B9%5D.Item.Idgenre=12&Genres%5B9%5D.Item.Name=Shooter&Genres%5B10%5D.Item.Idgenre=6&Genres%5B10%5D.Item.Name=Simulation&Genres%5B11%5D.Item.Idgenre=14&Genres%5B11%5D.Item.Name=Soulslike&Genres%5B12%5D.Item.Idgenre=7&Genres%5B12%5D.Item.Name=Sports&Genres%5B13%5D.Item.Idgenre=15&Genres%5B13%5D.Item.Name=Stealth&Genres%5B14%5D.Item.Idgenre=9&Genres%5B14%5D.Item.Name=Strategy&Genres%5B15%5D.Item.Idgenre=11&Genres%5B15%5D.Item.Name=Survival&Genres%5B16%5D.Item.Idgenre=4&Genres%5B16%5D.Item.Name=Western&Platforms%5B0%5D.Item.Idplatform=13&Platforms%5B0%5D.Item.Name=Linux&Platforms%5B1%5D.Item.Idplatform=14&Platforms%5B1%5D.Item.Name=MacOS&Platforms%5B2%5D.Item.Idplatform=15&Platforms%5B2%5D.Item.Name=Nintendo+Entertainment+System&Platforms%5B3%5D.Item.Idplatform=11&Platforms%5B3%5D.Item.Name=Nintendo+Switch&Platforms%5B4%5D.Item.Idplatform=1&Platforms%5B4%5D.Item.Name=Sony+PlayStation&Platforms%5B5%5D.Item.Idplatform=2&Platforms%5B5%5D.Item.Name=Sony+PlayStation+2&Platforms%5B6%5D.Item.Idplatform=3&Platforms%5B6%5D.Item.Name=Sony+PlayStation+3&Platforms%5B7%5D.Item.Idplatform=4&Platforms%5B7%5D.Item.Name=Sony+PlayStation+4&Platforms%5B8%5D.Item.Idplatform=5&Platforms%5B8%5D.Item.Name=Sony+PlayStation+5&Platforms%5B9%5D.Item.Idplatform=12&Platforms%5B9%5D.Item.Name=Sony+PlayStation+Vita&Platforms%5B10%5D.Item.Idplatform=10&Platforms%5B10%5D.Item.Name=Windows&Platforms%5B11%5D.Item.Idplatform=6&Platforms%5B11%5D.Item.Name=Xbox&Platforms%5B12%5D.Item.Idplatform=7&Platforms%5B12%5D.Item.Name=Xbox+360&Platforms%5B13%5D.Item.Idplatform=8&Platforms%5B13%5D.Item.Name=Xbox+One&Platforms%5B14%5D.Item.Idplatform=9&Platforms%5B14%5D.Item.Name=Xbox+Series+X%2Fs&Studios%5B0%5D.Item.Idstudio=14&Studios%5B0%5D.Item.Name=2K+Games&Studios%5B1%5D.Item.Idstudio=19&Studios%5B1%5D.Item.Name=Bandai+Namco+Intertainment&Studios%5B2%5D.Item.Idstudio=4&Studios%5B2%5D.Item.Name=Bethesda+Game+Studios&Studios%5B3%5D.Item.Idstudio=5&Studios%5B3%5D.Item.Name=Bethesda+Softworks&Studios%5B4%5D.Selected=true&Studios%5B4%5D.Item.Idstudio=1&Studios%5B4%5D.Item.Name=CD+Project+Red&Studios%5B5%5D.Item.Idstudio=9&Studios%5B5%5D.Item.Name=EA+Canada&Studios%5B6%5D.Item.Idstudio=10&Studios%5B6%5D.Item.Name=Electronic+Arts&Studios%5B7%5D.Item.Idstudio=13&Studios%5B7%5D.Item.Name=Firaxis+Games&Studios%5B8%5D.Item.Idstudio=18&Studios%5B8%5D.Item.Name=FromSoftware&Studios%5B9%5D.Item.Idstudio=11&Studios%5B9%5D.Item.Name=Giants+Software&Studios%5B10%5D.Item.Idstudio=8&Studios%5B10%5D.Item.Name=Mojang+Studios&Studios%5B11%5D.Item.Idstudio=25&Studios%5B11%5D.Item.Name=Nintendo&Studios%5B12%5D.Item.Idstudio=24&Studios%5B12%5D.Item.Name=Nintendo+EPD&Studios%5B13%5D.Item.Idstudio=26&Studios%5B13%5D.Item.Name=Nintendo+R%26D4&Studios%5B14%5D.Item.Idstudio=22&Studios%5B14%5D.Item.Name=PlayWay+S.+A.&Studios%5B15%5D.Item.Idstudio=15&Studios%5B15%5D.Item.Name=PUBG+Corporation&Studios%5B16%5D.Item.Idstudio=21&Studios%5B16%5D.Item.Name=Red+Dot+Games&Studios%5B17%5D.Item.Idstudio=3&Studios%5B17%5D.Item.Name=Rockstar+Games&Studios%5B18%5D.Item.Idstudio=16&Studios%5B18%5D.Item.Name=Rockstar+North&Studios%5B19%5D.Item.Idstudio=2&Studios%5B19%5D.Item.Name=Rockstar+Studios&Studios%5B20%5D.Item.Idstudio=6&Studios%5B20%5D.Item.Name=SCE+Santa+Monica+Studio&Studios%5B21%5D.Item.Idstudio=7&Studios%5B21%5D.Item.Name=Sony+Computer+Entertainment&Studios%5B22%5D.Item.Idstudio=20&Studios%5B22%5D.Item.Name=Sucker+Punch+Productions&Studios%5B23%5D.Item.Idstudio=17&Studios%5B23%5D.Item.Name=Take-Two+Interactive&Studios%5B24%5D.Item.Idstudio=12&Studios%5B24%5D.Item.Name=Valve&Studios%5B25%5D.Item.Idstudio=23&Studios%5B25%5D.Item.Name=%D0%AD%D0%B4%D0%BC%D1%83%D0%BD%D0%B4+%D0%9C%D0%B0%D0%BA%D0%BC%D0%B8%D0%BB%D0%BB%D0%B5%D0%BD&MinimumYear=1900&MaximumYear=2100&MinimumRate=0&MaximumRate=5&Genres%5B0%5D.Selected=false&Genres%5B1%5D.Selected=false&Genres%5B2%5D.Selected=false&Genres%5B3%5D.Selected=false&Genres%5B4%5D.Selected=false&Genres%5B5%5D.Selected=false&Genres%5B6%5D.Selected=false&Genres%5B7%5D.Selected=false&Genres%5B8%5D.Selected=false&Genres%5B9%5D.Selected=false&Genres%5B10%5D.Selected=false&Genres%5B11%5D.Selected=false&Genres%5B12%5D.Selected=false&Genres%5B13%5D.Selected=false&Genres%5B14%5D.Selected=false&Genres%5B15%5D.Selected=false&Genres%5B16%5D.Selected=false&Platforms%5B0%5D.Selected=false&Platforms%5B1%5D.Selected=false&Platforms%5B2%5D.Selected=false&Platforms%5B3%5D.Selected=false&Platforms%5B4%5D.Selected=false&Platforms%5B5%5D.Selected=false&Platforms%5B6%5D.Selected=false&Platforms%5B7%5D.Selected=false&Platforms%5B8%5D.Selected=false&Platforms%5B9%5D.Selected=false&Platforms%5B10%5D.Selected=false&Platforms%5B11%5D.Selected=false&Platforms%5B12%5D.Selected=false&Platforms%5B13%5D.Selected=false&Platforms%5B14%5D.Selected=false&Studios%5B0%5D.Selected=false&Studios%5B1%5D.Selected=false&Studios%5B2%5D.Selected=false&Studios%5B3%5D.Selected=false&Studios%5B4%5D.Selected=false&Studios%5B5%5D.Selected=false&Studios%5B6%5D.Selected=false&Studios%5B7%5D.Selected=false&Studios%5B8%5D.Selected=false&Studios%5B9%5D.Selected=false&Studios%5B10%5D.Selected=false&Studios%5B11%5D.Selected=false&Studios%5B12%5D.Selected=false&Studios%5B13%5D.Selected=false&Studios%5B14%5D.Selected=false&Studios%5B15%5D.Selected=false&Studios%5B16%5D.Selected=false&Studios%5B17%5D.Selected=false&Studios%5B18%5D.Selected=false&Studios%5B19%5D.Selected=false&Studios%5B20%5D.Selected=false&Studios%5B21%5D.Selected=false&Studios%5B22%5D.Selected=false&Studios%5B23%5D.Selected=false&Studios%5B24%5D.Selected=false&Studios%5B25%5D.Selected=false");

            response.EnsureSuccessStatusCode();

            var content = await response.Content.ReadAsStringAsync();

            Assert.Contains("Witcher 3", content);
        }

        [Fact]
        public async Task Test_GameController_Page()
        {
            var response = await _client.GetAsync("/Games/Page/1");

            response.EnsureSuccessStatusCode();

            var content = await response.Content.ReadAsStringAsync();

            Assert.Contains("Witcher 3", content);
        }

        [Fact]
        public async Task Test_ProfileController_Login()
        {
            var response = await _client.GetAsync("/Profile/Login");

            response.EnsureSuccessStatusCode();

            var content = await response.Content.ReadAsStringAsync();

            Assert.Contains("Логин", content);
        }

        [Fact]
        public async Task Test_ProfileController_Register()
        {
            var response = await _client.GetAsync("/Profile/Register");

            response.EnsureSuccessStatusCode();

            var content = await response.Content.ReadAsStringAsync();

            Assert.Contains("Логин", content);
        }
    }
}
