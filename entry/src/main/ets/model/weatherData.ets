class weatherData{
    day: string
    day_wind_power: string
    night_wind_power: string;
    night_weather_code: string
    day_weather: string
    sun_begin_end: string
    air_press: string
    day_weather_code: string
    night_weather_pic: string
    night_weather: string
    jiangshui: string
    day_air_temperature: string
    night_wind_direction: string
    ziwaixian: string
    weekday: string
    night_air_temperature: string
    day_weather_pic: string;
    day_wind_direction: string

    constructor(ff) {
        this.day_wind_power = ff["day_wind_power"];
        this.night_wind_power = ff["night_wind_power"];
        this.night_weather_code = ff["night_weather_code"];
        this.day_weather = ff["day_weather"];
        this.sun_begin_end = ff["sun_begin_end"];
        this.air_press = ff["air_press"];
        this.day_weather_code = ff["day_weather_code"];
        this.day = ff["day"];
        this.night_weather_pic = ff["night_weather_pic"];
        this.night_weather = ff["night_weather"];
        this.jiangshui = ff["jiangshui"];
        this.day_air_temperature = ff["day_air_temperature"];
        this.night_wind_direction = ff["night_wind_direction"];
        this.ziwaixian = ff["ziwaixian"];
        this.weekday = ff["weekday"];
        this.night_air_temperature = ff["night_air_temperature"];
        this.day_weather_pic = ff["day_weather_pic"];
        this.day_wind_direction = ff["day_wind_direction"];
    }
}
export default weatherData;