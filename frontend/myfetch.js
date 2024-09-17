async function myFetch(url, options) {
  const res = await fetch(url, options);
  const body = await res.json();
  if (!res.ok) throw new Error(body.message);
  if (res.status >= 200 && res.status <= 299) return body;
  throw new Error("Esto está raro.");
}
