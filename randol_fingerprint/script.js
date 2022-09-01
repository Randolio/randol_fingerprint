const copyToClipboard = str => {
    const el = document.createElement('textarea');
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
 };

window.addEventListener('message', (event) => {
    if (event.data.type === 'clipboard') {
        copyToClipboard(event.data.data);
    }
});
