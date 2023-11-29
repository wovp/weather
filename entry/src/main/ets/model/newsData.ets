class newsData{
    title: string;
    pubDate: string;
    source: string;
    link: string;

    constructor(nn) {
        this.title = nn["title"]
        this.pubDate = nn["pubDate"]
        this.source = nn["source"]
        this.link = nn["link"]
    }
}

export default newsData;