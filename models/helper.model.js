
const linkStatic = "https://7a6e-113-160-226-168.ngrok-free.app/"
class HelperModel {
    convertLinkStatic = (params = [{}], key = "") => {
        params = params.map((item, index) => {
            if (item[key]) {
                item[key] = item[key].replace(/[&\/\\]/g,'/');
                item[key] = linkStatic + item[key]
            }
            return item;
        });
        return params;
    }

    convertLinkStaticObj = (item = {}, key = "") => {
        if (item[key]) {
            item[key] = item[key].replace(/[&\/\\]/g,'/');
            item[key] = linkStatic + item[key]
        }
        return item;
    }
}

module.exports = new HelperModel;
