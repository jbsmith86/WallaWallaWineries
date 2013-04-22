import urllib
import urllib2
import re
import csv

class Winery(object):
    def __init__(self, name, address, city, state, zip, lat=None, long=None, phone=None, website=None, email=None, twitter=None, facebook=None):
        self.name = name
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.latitude = lat
        self.longitude = long
        self.phone = phone
        self.website = website
        self.email = email
        self.twitter = twitter
        self.facebook = facebook
    def __name__(self):
        return self.name
    def __lt__(self, other):
        return self.name < other.name
    def __repr__(self):
        return self.name

wineries = []
csvfile = open('wineryurls.csv')
csvreader = csv.reader(csvfile)
urls = []
while True:
    try:
        urls.append(csvreader.next())
    except:
        break

for i in urls:
    page = urllib.urlopen(i[1])
    file = page.read()
    page.close()
    addpattern = re.compile('li>Address: (.+?)</li')
    citypattern =  re.compile('li>City: (.+?)</li')
    statepattern =  re.compile('li>State: (.+?)</li')
    zippattern = re.compile('li>Zip/Postal Code: (.+?)</li')
    latpattern = re.compile('li>Latitude: (.+?)</li')
    longpattern = re.compile('li>Longitude: (.+?)</li')
    phonepattern = re.compile('li>Phone: (.+?)</li')
    webpattern = re.compile('li>Website: <a href="(.+?)">')
    emlpattern = re.compile('li>Email: <a href="mailto:(.+?)">')
    twitpattern = re.compile('li>Twitter Link: <a href="(.+?)" rel="nofollow">')
    fbpattern = re.compile('li>Facebook Link: <a href="(.+?)" rel="nofollow">')
    
    wineryname = i[0]
    try:
        address = addpattern.findall(file)[0]
    except:
        address = None
    try:
        city = citypattern.findall(file)[0]
    except:
        city = None
    try:
        state = statepattern.findall(file)[0]
    except:
        state = None
    try:
        zipcode = zippattern.findall(file)[0]
    except:
        zipcode = None
    try:
        lat = latpattern.findall(file)[0]
    except:
        lat = None
    try:
        long = longpattern.findall(file)[0]
    except:
        long = None
    try:
        phone = phonepattern.findall(file)[0]
    except:
        phone = None
    try:
        website = webpattern.findall(file)[0]
        request = urllib2.Request(website)
        responce = urllib2.urlopen(request)
        finalurl = responce.geturl()
    except:
        finalurl = None
    try:
        email = emlpattern.findall(file)[0]
    except:
        email = None
    try:
        twitter = twitpattern.findall(file)[0]
    except:
        twitter = None
    try:
        facebook = fbpattern.findall(file)[0]
    except:
        facebook = None

    wineries.append(Winery(wineryname, address, city, state, zipcode, lat, long, phone, finalurl, email, twitter, facebook))

file_writer = csv.writer(open('winerydb.csv', 'wb'))
file_writer.writerow(['Winery Name', 'Address', 'City', 'State', 'Zip', 'Latitude', 'Longitude', 'Phone Number', 'Website URL', 'Twitter', 'Facebook'])

for j in wineries:
    row = []
    row.append(j.name)
    if j.address == None:
        row.append('')
    else:
        row.append(j.address)
    if j.city == None:
        row.append('')
    else:
        row.append(j.city)
    if j.state == None:
        row.append('')
    else:
        row.append(j.state)
    if j.zip == None:
        row.append('')
    else:
        row.append(j.zip)
    if j.latitude == None:
        row.append('')
    else:
        row.append(j.latitude)
    if j.longitude == None:
        row.append('')
    else:
        row.append(j.longitude)
    if j.phone == None:
        row.append('')
    else:
        row.append(j.phone)
    if j.website == None:
        row.append('')
    else:
        row.append(j.website)
    if j.twitter == None:
        row.append('')
    else:
        row.append(j.twitter)
    if j.facebook == None:
        row.append('')
    else:
        row.append(j.facebook)
    file_writer.writerow(row)