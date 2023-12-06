/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import http from '@ohos.net.http';

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @returns the result of HTTPS.
 */
export function httpWeatherGet(url: string) {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();
  let appcode = 'd05915f2d9bf4f58a8e264679418af74'
  let querys = "areaCode=500000&needMoreDay=1&needIndex=0&need3HourForcast=0&needAlarm=0&needHourData=needHourData"
  let options = {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json',
      'Authorization': 'APPCODE ' + appcode,
    },
    expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
  } as http.HttpRequestOptions;
  url = url + "?" + querys;
  let result = request.request(url, options);
  return result;
}

export async function httpNewsGet(url: string){
  if (!url) {
    return undefined;
  }
  let testhost = 'https://news1.market.alicloudapi.com'
  let testpath = '/newsList'
  let request = http.createHttp();
  let appcode = 'd05915f2d9bf4f58a8e264679418af74'
  let querys = 'channelId=5572a108b3cdc86cf39001cd&page=1&maxResult=20'
  let options = {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'APPCODE ' + appcode,
    },
    expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
  } as http.HttpRequestOptions;
  url = url + "?" + querys;
  let result = await request.request(testhost + testpath + "?" + querys, options);

  return result;
}

