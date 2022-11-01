namespace GamePlay.Models
{
    public class IndexViewModel
    {
        public class Filter<T>
        {
            public T? Item { get; set; }

            public bool Selected { get; set; } = false;
        }

        public List<Game> Games { get; set; } = new List<Game>();

        public List<Filter<Genre>> Genres { get; private set; } = new List<Filter<Genre>>();

        public List<Filter<Platform>> Platforms { get; private set; } = new List<Filter<Platform>>();

        public List<Filter<Studio>> Studios { get; private set; } = new List<Filter<Studio>>();

        public void Set<T>(List<T> items)
        {
            List<Filter<T>> filters = new List<Filter<T>>();

            for (int i = 0; i < items.Count; i++)
            {
                Filter<T> filter = new Filter<T>() { Item = items[i] };
                filters.Add(filter);
            }

            if (typeof(T) == typeof(Genre))
                Genres = filters.ConvertAll(new Converter<Filter<T>, Filter<Genre>>(ToFilterGenre));
            
            else if (typeof(T) == typeof(Platform))
                Platforms = filters.ConvertAll(new Converter<Filter<T>, Filter<Platform>>(ToFilterPlatform));
            
            else if (typeof(T) == typeof(Studio))
                Studios = filters.ConvertAll(new Converter<Filter<T>, Filter<Studio>>(ToFilterStudio));
        }

         public List<Genre> GetSelectedGenres()
         {
            return Genres.ConvertAll(new Converter<Filter<Genre>, Genre>(ToGenre));
         }

        public List<Platform> GetSelectedPlatforms()
        {
            return Platforms.ConvertAll(new Converter<Filter<Platform>, Platform>(ToPlatform));
        }

        public List<Studio> GetSelectedStudios()
        {
            return Studios.ConvertAll(new Converter<Filter<Studio>, Studio>(ToStudio));
        }

        private Filter<Genre> ToFilterGenre<T>(Filter<T> item)
        {
            return new Filter<Genre>() { Item = item.Item as Genre };
        }

        private Filter<Platform> ToFilterPlatform<T>(Filter<T> item)
        {
            return new Filter<Platform>() { Item = item.Item as Platform };
        }

        private Filter<Studio> ToFilterStudio<T>(Filter<T> item)
        {
            return new Filter<Studio>() { Item = item.Item as Studio };
        }

        private Genre ToGenre(Filter<Genre> filter)
        {
            return filter.Selected ? filter.Item : null;
        }

        private Platform ToPlatform(Filter<Platform> filter)
        {
            return filter.Selected ? filter.Item : null;
        }

        private Studio ToStudio(Filter<Studio> filter)
        {
            return filter.Selected ? filter.Item : null;
        }
    }
}
