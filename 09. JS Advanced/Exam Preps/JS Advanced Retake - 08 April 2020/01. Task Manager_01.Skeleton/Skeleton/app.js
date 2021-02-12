function solve() {

    const task = document.getElementById('task');
    const description = document.getElementById('description');
    const date = document.getElementById('date');

    const add = document.getElementById('add');
    const open = document.querySelector('section:nth-child(2)').children[1];
    const inProgress = document.querySelector('section:nth-child(3)').children[1];
    const completed = document.querySelector('section:nth-child(4)').children[1];


    add.addEventListener('click', onAddTask);
    open.addEventListener('click', onOpen);
    inProgress.addEventListener('click', onInProgress);

    function onAddTask(e) {
        e.preventDefault();
        if (task.value === '' ||
            description.value === '' ||
            date.value === '') {
            return;
        }
        const article = document.createElement('article');

        const h3 = document.createElement('h3');
        h3.textContent = task.value;

        const p1 = document.createElement('p');
        p1.textContent = description.value;

        const p2 = document.createElement('p');
        p2.textContent = date.value;

        const div = document.createElement('div');
        div.className = 'flex';

        const button1 = document.createElement('button');
        button1.className = 'green';
        button1.textContent = 'Start';

        const button2 = document.createElement('button');
        button2.className = 'red';
        button2.textContent = 'Delete';

        div.appendChild(button1);
        div.appendChild(button2);
        article.appendChild(h3);
        article.appendChild(p1);
        article.appendChild(p2);
        article.appendChild(div);

        open.appendChild(article);
    }

    function onOpen(e) {
        if (e.target.className === 'red') {
            e.target.parentNode.parentNode.remove();
        } else if (e.target.className === 'green') {
            const button1 = e.target.parentNode.children[0];
            button1.className = 'red';
            button1.textContent = 'Delete';

            const button2 = e.target.parentNode.children[1];
            button2.className = 'orange';
            button2.textContent = 'Finish';

            const article = e.target.parentNode.parentNode;

            e.target.parentNode.parentNode.remove();

            inProgress.appendChild(article);
        }
    };

    function onInProgress(e) {
        if (e.target.className === 'red') {
            e.target.parentNode.parentNode.remove();
        }
        else if (e.target.className === 'orange') {
            const article = e.target.parentNode.parentNode;

            e.target.parentNode.parentNode.remove();
            article.children[3].remove();

            completed.appendChild(article);
        }
    };
}